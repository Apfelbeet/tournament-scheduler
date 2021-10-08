import * as redis from "redis";
import { Key } from "../types/general_types";
import * as logger from "../util/logger";
import { Tournament } from "../logic/tournament";
import * as instancer from "./instancer";
import { TournamentImage } from "../types/database_types";
import * as config from "../logic/server_config";

let redis_client: redis.RedisClient;

export function init(onReady: (channel: string, message: string) => void) {
    redis_client = redis.createClient(config.getDatabaseConfig());
    redis_client.on("ready", (channel, message) => {
        logger.success(`Database Connection established with ${config.getDatabaseConfig().host}:${config.getDatabaseConfig().port}!`);
        onReady(channel, message);
    });
    redis_client.on("error", (err) => {
        logger.error(err);
    });
    redis_client.on("end", () => {
        redis_client.quit();
        logger.error("Database disconnected!");
    });
}

export function isConnected(): boolean {
    return redis_client.connected;
}

export async function getTournamentKeys(): Promise<Key[]> {
    return new Promise((res, rej) => {
        redis_client.keys("*", (err, keys) => {
            if (err) rej(err);
            else res(keys);
        });
    });
}

export async function storeTournament(key: Key, tournament: Tournament) {
    const data: string = JSON.stringify(instancer.imageOfTournament(tournament));
    logger.database(`${key}: Store tournament data:\n${data}`);
    redis_client.set(
        key,
        data
    );
}

export async function loadTournament(key: Key): Promise<Tournament> {
    logger.log(`${key}: Loading data from database!`);
    return new Promise((res, rej) => {
        redis_client.get(key, (err, string_data) => {
            if (err) rej(err);
            else if (string_data !== null) {
                logger.database(`${key}: Received tournament data:\n${string_data}`)
                const image: TournamentImage = JSON.parse(string_data);
                res(instancer.instanceTournament(image));
            } else {
                rej(`There is currently no entry for ${key} in the database!`);
            }
        });
    });
}

export async function removeTournament(key: Key) {
    redis_client.del(key, (err, res) => {
        if (err) logger.error(err.message)});
}
