import type * as grpc from '@grpc/grpc-js';
import type { EnumTypeDefinition, MessageTypeDefinition } from '@grpc/proto-loader';

import type { ServerAPIClient as _logicAPI_ServerAPIClient, ServerAPIDefinition as _logicAPI_ServerAPIDefinition } from './logicAPI/ServerAPI';
import type { TournamentAPIClient as _logicAPI_TournamentAPIClient, TournamentAPIDefinition as _logicAPI_TournamentAPIDefinition } from './logicAPI/TournamentAPI';

type SubtypeConstructor<Constructor extends new (...args: any) => any, Subtype> = {
  new(...args: ConstructorParameters<Constructor>): Subtype;
};

export interface ProtoGrpcType {
  logicAPI: {
    Acknowledgment: MessageTypeDefinition
    Empty: MessageTypeDefinition
    GameData: MessageTypeDefinition
    KeyPermissionPair: MessageTypeDefinition
    KeyPermissionPairs: MessageTypeDefinition
    Mode: MessageTypeDefinition
    Modes: MessageTypeDefinition
    PERMISSION: EnumTypeDefinition
    Permission: MessageTypeDefinition
    PermissionKeys: MessageTypeDefinition
    PermissionQuery: MessageTypeDefinition
    RemovePermissionKey: MessageTypeDefinition
    ResponseTournamentData: MessageTypeDefinition
    ServerAPI: SubtypeConstructor<typeof grpc.Client, _logicAPI_ServerAPIClient> & { service: _logicAPI_ServerAPIDefinition }
    ServerEvent: MessageTypeDefinition
    SetMode: MessageTypeDefinition
    SetPermission: MessageTypeDefinition
    SetResult: MessageTypeDefinition
    Stats: MessageTypeDefinition
    StructureData: MessageTypeDefinition
    TeamAdd: MessageTypeDefinition
    TeamData: MessageTypeDefinition
    TeamEdit: MessageTypeDefinition
    TeamRemove: MessageTypeDefinition
    TournamentAPI: SubtypeConstructor<typeof grpc.Client, _logicAPI_TournamentAPIClient> & { service: _logicAPI_TournamentAPIDefinition }
    TournamentAccess: MessageTypeDefinition
    TournamentCreate: MessageTypeDefinition
    TournamentCreateAcknowledgment: MessageTypeDefinition
    TournamentData: MessageTypeDefinition
    TournamentDetailsList: MessageTypeDefinition
    TournamentEvent: MessageTypeDefinition
    TournamentStatusData: MessageTypeDefinition
    TournamentStructureData: MessageTypeDefinition
    TournamentTeamData: MessageTypeDefinition
  }
}

