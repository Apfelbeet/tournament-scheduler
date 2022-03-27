// Original file: ../proto/logic_api.proto

import type * as grpc from '@grpc/grpc-js'
import type { MethodDefinition } from '@grpc/proto-loader'
import type { Acknowledgment as _logicAPI_Acknowledgment, Acknowledgment__Output as _logicAPI_Acknowledgment__Output } from '../logicAPI/Acknowledgment';
import type { ResponseTournamentData as _logicAPI_ResponseTournamentData, ResponseTournamentData__Output as _logicAPI_ResponseTournamentData__Output } from '../logicAPI/ResponseTournamentData';
import type { SetMode as _logicAPI_SetMode, SetMode__Output as _logicAPI_SetMode__Output } from '../logicAPI/SetMode';
import type { SetResult as _logicAPI_SetResult, SetResult__Output as _logicAPI_SetResult__Output } from '../logicAPI/SetResult';
import type { TeamAdd as _logicAPI_TeamAdd, TeamAdd__Output as _logicAPI_TeamAdd__Output } from '../logicAPI/TeamAdd';
import type { TeamEdit as _logicAPI_TeamEdit, TeamEdit__Output as _logicAPI_TeamEdit__Output } from '../logicAPI/TeamEdit';
import type { TeamRemove as _logicAPI_TeamRemove, TeamRemove__Output as _logicAPI_TeamRemove__Output } from '../logicAPI/TeamRemove';
import type { TournamentAccess as _logicAPI_TournamentAccess, TournamentAccess__Output as _logicAPI_TournamentAccess__Output } from '../logicAPI/TournamentAccess';
import type { TournamentEvent as _logicAPI_TournamentEvent, TournamentEvent__Output as _logicAPI_TournamentEvent__Output } from '../logicAPI/TournamentEvent';

export interface TournamentAPIClient extends grpc.Client {
  addTeam(argument: _logicAPI_TeamAdd, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  addTeam(argument: _logicAPI_TeamAdd, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  addTeam(argument: _logicAPI_TeamAdd, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  addTeam(argument: _logicAPI_TeamAdd, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  addTeam(argument: _logicAPI_TeamAdd, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  addTeam(argument: _logicAPI_TeamAdd, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  addTeam(argument: _logicAPI_TeamAdd, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  addTeam(argument: _logicAPI_TeamAdd, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
  editTeam(argument: _logicAPI_TeamEdit, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  editTeam(argument: _logicAPI_TeamEdit, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  editTeam(argument: _logicAPI_TeamEdit, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  editTeam(argument: _logicAPI_TeamEdit, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  editTeam(argument: _logicAPI_TeamEdit, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  editTeam(argument: _logicAPI_TeamEdit, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  editTeam(argument: _logicAPI_TeamEdit, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  editTeam(argument: _logicAPI_TeamEdit, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
  load(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_ResponseTournamentData__Output>): grpc.ClientUnaryCall;
  load(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_ResponseTournamentData__Output>): grpc.ClientUnaryCall;
  load(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_ResponseTournamentData__Output>): grpc.ClientUnaryCall;
  load(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_ResponseTournamentData__Output>): grpc.ClientUnaryCall;
  load(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_ResponseTournamentData__Output>): grpc.ClientUnaryCall;
  load(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_ResponseTournamentData__Output>): grpc.ClientUnaryCall;
  load(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_ResponseTournamentData__Output>): grpc.ClientUnaryCall;
  load(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_ResponseTournamentData__Output>): grpc.ClientUnaryCall;
  
  removeTeam(argument: _logicAPI_TeamRemove, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTeam(argument: _logicAPI_TeamRemove, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTeam(argument: _logicAPI_TeamRemove, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTeam(argument: _logicAPI_TeamRemove, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTeam(argument: _logicAPI_TeamRemove, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTeam(argument: _logicAPI_TeamRemove, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTeam(argument: _logicAPI_TeamRemove, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  removeTeam(argument: _logicAPI_TeamRemove, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
  reset(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  reset(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  reset(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  reset(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  reset(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  reset(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  reset(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  reset(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
  setMode(argument: _logicAPI_SetMode, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setMode(argument: _logicAPI_SetMode, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setMode(argument: _logicAPI_SetMode, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setMode(argument: _logicAPI_SetMode, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setMode(argument: _logicAPI_SetMode, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setMode(argument: _logicAPI_SetMode, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setMode(argument: _logicAPI_SetMode, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setMode(argument: _logicAPI_SetMode, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
  setResult(argument: _logicAPI_SetResult, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setResult(argument: _logicAPI_SetResult, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setResult(argument: _logicAPI_SetResult, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setResult(argument: _logicAPI_SetResult, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setResult(argument: _logicAPI_SetResult, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setResult(argument: _logicAPI_SetResult, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setResult(argument: _logicAPI_SetResult, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  setResult(argument: _logicAPI_SetResult, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
  start(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  start(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  start(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  start(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  start(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  start(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  start(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  start(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
  subscribe(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options?: grpc.CallOptions): grpc.ClientReadableStream<_logicAPI_TournamentEvent__Output>;
  subscribe(argument: _logicAPI_TournamentAccess, options?: grpc.CallOptions): grpc.ClientReadableStream<_logicAPI_TournamentEvent__Output>;
  subscribe(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options?: grpc.CallOptions): grpc.ClientReadableStream<_logicAPI_TournamentEvent__Output>;
  subscribe(argument: _logicAPI_TournamentAccess, options?: grpc.CallOptions): grpc.ClientReadableStream<_logicAPI_TournamentEvent__Output>;
  
  unsubscribe(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  unsubscribe(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  unsubscribe(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  unsubscribe(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  unsubscribe(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  unsubscribe(argument: _logicAPI_TournamentAccess, metadata: grpc.Metadata, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  unsubscribe(argument: _logicAPI_TournamentAccess, options: grpc.CallOptions, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  unsubscribe(argument: _logicAPI_TournamentAccess, callback: grpc.requestCallback<_logicAPI_Acknowledgment__Output>): grpc.ClientUnaryCall;
  
}

export interface TournamentAPIHandlers extends grpc.UntypedServiceImplementation {
  addTeam: grpc.handleUnaryCall<_logicAPI_TeamAdd__Output, _logicAPI_Acknowledgment>;
  
  editTeam: grpc.handleUnaryCall<_logicAPI_TeamEdit__Output, _logicAPI_Acknowledgment>;
  
  load: grpc.handleUnaryCall<_logicAPI_TournamentAccess__Output, _logicAPI_ResponseTournamentData>;
  
  removeTeam: grpc.handleUnaryCall<_logicAPI_TeamRemove__Output, _logicAPI_Acknowledgment>;
  
  reset: grpc.handleUnaryCall<_logicAPI_TournamentAccess__Output, _logicAPI_Acknowledgment>;
  
  setMode: grpc.handleUnaryCall<_logicAPI_SetMode__Output, _logicAPI_Acknowledgment>;
  
  setResult: grpc.handleUnaryCall<_logicAPI_SetResult__Output, _logicAPI_Acknowledgment>;
  
  start: grpc.handleUnaryCall<_logicAPI_TournamentAccess__Output, _logicAPI_Acknowledgment>;
  
  subscribe: grpc.handleServerStreamingCall<_logicAPI_TournamentAccess__Output, _logicAPI_TournamentEvent>;
  
  unsubscribe: grpc.handleUnaryCall<_logicAPI_TournamentAccess__Output, _logicAPI_Acknowledgment>;
  
}

export interface TournamentAPIDefinition extends grpc.ServiceDefinition {
  addTeam: MethodDefinition<_logicAPI_TeamAdd, _logicAPI_Acknowledgment, _logicAPI_TeamAdd__Output, _logicAPI_Acknowledgment__Output>
  editTeam: MethodDefinition<_logicAPI_TeamEdit, _logicAPI_Acknowledgment, _logicAPI_TeamEdit__Output, _logicAPI_Acknowledgment__Output>
  load: MethodDefinition<_logicAPI_TournamentAccess, _logicAPI_ResponseTournamentData, _logicAPI_TournamentAccess__Output, _logicAPI_ResponseTournamentData__Output>
  removeTeam: MethodDefinition<_logicAPI_TeamRemove, _logicAPI_Acknowledgment, _logicAPI_TeamRemove__Output, _logicAPI_Acknowledgment__Output>
  reset: MethodDefinition<_logicAPI_TournamentAccess, _logicAPI_Acknowledgment, _logicAPI_TournamentAccess__Output, _logicAPI_Acknowledgment__Output>
  setMode: MethodDefinition<_logicAPI_SetMode, _logicAPI_Acknowledgment, _logicAPI_SetMode__Output, _logicAPI_Acknowledgment__Output>
  setResult: MethodDefinition<_logicAPI_SetResult, _logicAPI_Acknowledgment, _logicAPI_SetResult__Output, _logicAPI_Acknowledgment__Output>
  start: MethodDefinition<_logicAPI_TournamentAccess, _logicAPI_Acknowledgment, _logicAPI_TournamentAccess__Output, _logicAPI_Acknowledgment__Output>
  subscribe: MethodDefinition<_logicAPI_TournamentAccess, _logicAPI_TournamentEvent, _logicAPI_TournamentAccess__Output, _logicAPI_TournamentEvent__Output>
  unsubscribe: MethodDefinition<_logicAPI_TournamentAccess, _logicAPI_Acknowledgment, _logicAPI_TournamentAccess__Output, _logicAPI_Acknowledgment__Output>
}
