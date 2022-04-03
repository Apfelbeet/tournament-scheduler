// Original file: ../proto/logic_api.proto

import type { TournamentAccess as _logicAPI_TournamentAccess, TournamentAccess__Output as _logicAPI_TournamentAccess__Output } from '../logicAPI/TournamentAccess';

export interface TournamentCreateAcknowledgment {
  'error'?: (string);
  'access'?: (_logicAPI_TournamentAccess | null);
  'response'?: "error"|"access";
}

export interface TournamentCreateAcknowledgment__Output {
  'error'?: (string);
  'access'?: (_logicAPI_TournamentAccess__Output);
}
