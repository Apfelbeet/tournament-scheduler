// Original file: ../proto/logic_api.proto

import type { TournamentAccess as _logicAPI_TournamentAccess, TournamentAccess__Output as _logicAPI_TournamentAccess__Output } from '../logicAPI/TournamentAccess';

export interface SetMode {
  'access'?: (_logicAPI_TournamentAccess | null);
  'id'?: (number);
}

export interface SetMode__Output {
  'access'?: (_logicAPI_TournamentAccess__Output);
  'id'?: (number);
}
