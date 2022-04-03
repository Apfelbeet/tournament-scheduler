import * as redis from "redis";
import * as logger from "../util/logger";
import { Tournament } from "../logic/tournament";
import * as instancer from "./instancer";
import { TournamentImage } from "../types/database_types";
import * as config from "../logic/server_config";
import { Key, Permission, PermissionKey } from "../types/tournament_types";
import { PermissionStorage } from "../types/general_types";

const TOURNAMENTS = "tournaments";
const PERMISSIONS = "permissions";

let redis_client: redis.RedisClient;

export function init(onReady: (channel: string, message: string) => void) {
    redis_client = redis.createClient(config.getDatabaseConfig());
    redis_client.on("ready", (channel, message) => {
        logger.success(
            `Database Connection established with ${
                config.getDatabaseConfig().host
            }:${config.getDatabaseConfig().port}!`
        );
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

// function loadOptional<T>(key: string, defaultValue: T): Promise<T> {
//     return new Promise<T>((res, rej) => {
//         redis_client.exists(key, (err, val) => {
//             if (val === 1)
//                 redis_client.get(key, (err, permissions) => {
//                     if (err) rej(err);
//                     else res(JSON.parse(permissions!));
//                 });
//             else res(defaultValue);
//         });
//     });
// }

function loadOptionalHash(key: string): Promise<Map<string, string>> {
    return new Promise((res, rej) => {
        redis_client.exists(key, (err, val) => {
            if (val === 1)
                redis_client.hgetall(key, (err, object) => {
                    if (err) rej(err);
                    else res(new Map(Object.entries(object!)));
                });
            else res(new Map());
        });
    });
}

export async function getTournamentKeys(): Promise<Key[]> {
    const map: Map<Key, string> = await loadOptionalHash(TOURNAMENTS);
    return Array.from(map, ([key, _]) => key);
}

export async function getPermissions(): Promise<Map<Key, PermissionStorage>> {
    const map = await loadOptionalHash(PERMISSIONS);
    
    const result: Map<Key, PermissionStorage> = new Map()
    for (let [key, value] of map) {
        result.set(key, new Map(Object.entries(JSON.parse(value))));
    }
    return result;
}

export async function storePermission(
    key: Key,
    permissions: PermissionStorage
) {
    const data: string = JSON.stringify(Object.fromEntries(permissions));
    logger.database(`Store permission:\n ${key} -> ${data}`);

    redis_client.hset(PERMISSIONS, key, data);
}

export async function removePermission(
    key: Key
) {
    logger.database(`Delete permissions of ${key}`);
    redis_client.hdel(PERMISSIONS, key);
}

export async function storeTournament(key: Key, tournament: Tournament) {
    const data: string = JSON.stringify(
        instancer.imageOfTournament(tournament)
    );
    logger.database(`${key}: Store tournament data:\n${data}`);
    // redis_client.set(
    //     key,
    //     data
    // );

    redis_client.hset(TOURNAMENTS, key, data);
}

export async function loadTournament(key: Key): Promise<Tournament> {
    logger.log(`${key}: Loading data from database!`);
    return new Promise((res, rej) => {
        redis_client.hget(TOURNAMENTS, key, (err, string_data) => {
            if (err) rej(err);
            else if (string_data !== null) {
                logger.database(
                    `${key}: Received tournament data:\n${string_data}`
                );
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
        if (err) logger.error(err.message);
    });
}
