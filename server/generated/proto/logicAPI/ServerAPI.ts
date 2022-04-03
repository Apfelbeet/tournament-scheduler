// Original file: ../proto/logic_api.proto

import type * as grpc from '@grpc/grpc-js'
import type { MethodDefinition } from '@grpc/proto-loader'
import type { Acknowledgment as _logicAPI_Acknowledgment, Acknowledgment__Output as _logicAPI_Acknowledgment__Output } from '../logicAPI/Acknowledgment';
import type { Empty as _logicAPI_Empty, Empty__Output as _logicAPI_Empty__Output } from '../logicAPI/Empty';
import type { Modes as _logicAPI_Modes, Modes__Output as _logicAPI_Modes__Output } from '../logicAPI/Modes';
import type { ServerEvent as _logicAPI_ServerEvent, ServerEvent__Output as _logicAPI_ServerEvent__Output } from '../logicAPI/ServerEvent';
import type { TournamentAccess as _logicAPI_TournamentAccess, TournamentAccess__Output as _logicAPI_TournamentAccess__Output } from '../logicAPI/TournamentAccess';
import type { TournamentCreate as _logicAPI_TournamentCreate, TournamentCreate__Output as _logicAPI_TournamentCreate__Output } from '../logicAPI/TournamentCreate';
import type { TournamentCreateAcknowledgment as _logicAPI_TournamentCreateAcknowledgment, TournamentCreateAcknowledgment__Output as _logicAPI_TournamentCreateAcknowledgment__Output } from '../logicAPI/TournamentCreateAcknowledgment';
import type { TournamentDetailsList as _logicAPI_TournamentDetailsList, TournamentDetailsList__Output as _logicAPI_TournamentDetailsList__Output } from '../logicAPI/TournamentDetailsList';

export interface ServerAPIClient extends grpc.Client {
  connect(argument: _logicAPI_Empty, metadata: grpc.Metadata, options?: grpc.CallOptions): grpc.ClientReadableStream<_logicAPI_ServerEvent__Output>;
  connect(argument: _logicAPI_Empty, options?: grpc.CallOptions): grpc.ClientReadableStream<_logicAPI_ServerEvent__Output>;
  connect(argument: _logicAPI_Empty, metadata: grpc.Metadata, options?: grpc.CallOptions): grpc.ClientReadableStream<_logicAPI_ServerEvent__Output>;
  connect(argument: _logicAPI_Empty, options?: grpc.CallOptions): grpc.ClientReadableStream<_logicAPI_ServerEvent__Output>;
  
  createTournament(argument: _logicAPI_TournamentCreate, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_TournamentCreateAcknowledgment__Output>): grpc.ClientUnaryCall;
  createTournament(argument: _logicAPI_TournamentCreate, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_TournamentCreateAcknowledgment__Output>): grpc.ClientUnaryCall;
  createTournament(argument: _logicAPI_TournamentCreate, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_TournamentCreateAcknowledgment__Output>): grpc.ClientUnaryCall;
  createTournament(argument: _logicAPI_TournamentCreate, callback: grpc.requestCallback<_logicAPI_TournamentCreateAcknowledgment__Output>): grpc.ClientUnaryCall;
  createTournament(argument: _logicAPI_TournamentCreate, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_TournamentCreateAcknowledgment__Output>): grpc.ClientUnaryCall;
  createTournament(argument: _logicAPI_TournamentCreate, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_TournamentCreateAcknowledgment__Output>): grpc.ClientUnaryCall;
  createTournament(argument: _logicAPI_TournamentCreate, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_TournamentCreateAcknowledgment__Output>): grpc.ClientUnaryCall;
  createTournament(argument: _logicAPI_TournamentCreate, callback: grpc.requestCallback<_logicAPI_TournamentCreateAcknowledgment__Output>): grpc.ClientUnaryCall;
  
  disconnect(argument: _logicAPI_Empty, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  disconnect(argument: _logicAPI_Empty, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  disconnect(argument: _logicAPI_Empty, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  disconnect(argument: _logicAPI_Empty, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  disconnect(argument: _logicAPI_Empty, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  disconnect(argument: _logicAPI_Empty, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  disconnect(argument: _logicAPI_Empty, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  disconnect(argument: _logicAPI_Empty, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
  getModes(argument: _logicAPI_Empty, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Modes__Output>): grpc.ClientUnaryCall;
  getModes(argument: _logicAPI_Empty, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Modes__Output>): grpc.ClientUnaryCall;
  getModes(argument: _logicAPI_Empty, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Modes__Output>): grpc.ClientUnaryCall;
  getModes(argument: _logicAPI_Empty, callback: grpc.requestCallback<_logicAPI_Modes__Output>): grpc.ClientUnaryCall;
  getModes(argument: _logicAPI_Empty, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Modes__Output>): grpc.ClientUnaryCall;
  getModes(argument: _logicAPI_Empty, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Modes__Output>): grpc.ClientUnaryCall;
  getModes(argument: _logicAPI_Empty, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Modes__Output>): grpc.ClientUnaryCall;
  getModes(argument: _logicAPI_Empty, callback: grpc.requestCallback<_logicAPI_Modes__Output>): grpc.ClientUnaryCall;
  
  getTournaments(argument: _logicAPI_Empty, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_TournamentDetailsList__Output>): grpc.ClientUnaryCall;
  getTournaments(argument: _logicAPI_Empty, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_TournamentDetailsList__Output>): grpc.ClientUnaryCall;
  getTournaments(argument: _logicAPI_Empty, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_TournamentDetailsList__Output>): grpc.ClientUnaryCall;
  getTournaments(argument: _logicAPI_Empty, callback: grpc.requestCallback<_logicAPI_TournamentDetailsList__Output>): grpc.ClientUnaryCall;
  getTournaments(argument: _logicAPI_Empty, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_TournamentDetailsList__Output>): grpc.ClientUnaryCall;
  getTournaments(argument: _logicAPI_Empty, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_TournamentDetailsList__Output>): grpc.ClientUnaryCall;
  getTournaments(argument: _logicAPI_Empty, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_TournamentDetailsList__Output>): grpc.ClientUnaryCall;
  getTournaments(argument: _logicAPI_Empty, callback: grpc.requestCallback<_logicAPI_TournamentDetailsList__Output>): grpc.ClientUnaryCall;
  
  removeTournament(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTournament(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTournament(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTournament(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTournament(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTournament(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTournament(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTournament(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
}

export interface ServerAPIHandlers extends grpc.UntypedServiceImplementation {
  connect: grpc.handleServerStreamingCall<_logicAPI_Empty__Output, _logicAPI_ServerEvent>;
  
  createTournament: grpc.handleUnaryCall<_logicAPI_TournamentCreate__Output, _logicAPI_TournamentCreateAcknowledgment>;
  
  disconnect: grpc.handleUnaryCall<_logicAPI_Empty__Output, _logicAPI_Acknowledgment>;
  
  getModes: grpc.handleUnaryCall<_logicAPI_Empty__Output, _logicAPI_Modes>;
  
  getTournaments: grpc.handleUnaryCall<_logicAPI_Empty__Output, _logicAPI_TournamentDetailsList>;
  
  removeTournament: grpc.handleUnaryCall<_logicAPI_TournamentAccess__Output, _logicAPI_Acknowledgment>;
  
}

export interface ServerAPIDefinition extends grpc.ServiceDefinition {
  connect: MethodDefinition<_logicAPI_Empty, _logicAPI_ServerEvent, _logicAPI_Empty__Output, _logicAPI_ServerEvent__Output>
  createTournament: MethodDefinition<_logicAPI_TournamentCreate, _logicAPI_TournamentCreateAcknowledgment, _logicAPI_TournamentCreate__Output, _logicAPI_TournamentCreateAcknowledgment__Output>
  disconnect: MethodDefinition<_logicAPI_Empty, _logicAPI_Acknowledgment, _logicAPI_Empty__Output, _logicAPI_Acknowledgment__Output>
  getModes: MethodDefinition<_logicAPI_Empty, _logicAPI_Modes, _logicAPI_Empty__Output, _logicAPI_Modes__Output>
  getTournaments: MethodDefinition<_logicAPI_Empty, _logicAPI_TournamentDetailsList, _logicAPI_Empty__Output, _logicAPI_TournamentDetailsList__Output>
  removeTournament: MethodDefinition<_logicAPI_TournamentAccess, _logicAPI_Acknowledgment, _logicAPI_TournamentAccess__Output, _logicAPI_Acknowledgment__Output>
}
