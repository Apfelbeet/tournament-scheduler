import * as grpc from "@grpc/grpc-js";
import { ServerWritableStream} from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";
import { Empty__Output } from "../../generated/proto/logicAPI/Empty";
import { ServerEvent } from "../../generated/proto/logicAPI/ServerEvent";
import { TournamentAccess__Output } from "../../generated/proto/logicAPI/TournamentAccess";
import { TournamentEvent } from "../../generated/proto/logicAPI/TournamentEvent";
import { ProtoGrpcType } from "../../generated/proto/logic_api"
import { Key } from "../types/general_types";
import * as logger from "../util/logger";
import ServerAPI from "./grpc_server_api";
import TournamentAPI from "./grpc_tournament";

let serverAPI;
let grpcServer: grpc.Server;

export const subscriptions = new Map<Key, ServerWritableStream<TournamentAccess__Output, TournamentEvent>[]>();
export let connections: ServerWritableStream<Empty__Output, ServerEvent>[] = [];

export function repalceConnections(list: ServerWritableStream<Empty__Output, ServerEvent>[]) {
    logger.debug(`New connection list with ${list.length} elements!`);
    connections = list;
} 

export function init(port: number) {
    const packageDef = protoLoader.loadSync("./../proto/logic_api.proto");
    const grpcObject = (grpc.loadPackageDefinition(packageDef) as unknown) as ProtoGrpcType;

    serverAPI = grpcObject.logicAPI;
    grpcServer = new grpc.Server();

    grpcServer.addService(serverAPI.ServerAPI.service, new ServerAPI());

    grpcServer.addService(serverAPI.TournamentAPI.service, new TournamentAPI());

    grpcServer.bindAsync(`0.0.0.0:${port}`, grpc.ServerCredentials.createInsecure(), (err, _port) => {
        if (err) {
            logger.error(`${err.name}: ${err.message}`);
        } else {
            grpcServer.start();
            logger.success(`gRPC Server listening on Port ${_port}!`);
        }
    });
}

export function sendServerEvent(event: ServerEvent) {
    connections.forEach(call => {
        call.write(event);
    })
}

export function sendTournamentEvent(key: Key, event: TournamentEvent) {
    logger.net(JSON.stringify(event));
    subscriptions.get(key)?.forEach((call) => {
        call.write(event);
    })
}

