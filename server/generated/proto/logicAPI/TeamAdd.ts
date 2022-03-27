// Original file: ../proto/logic_api.proto

import type { TournamentAccess as _logicAPI_TournamentAccess, TournamentAccess__Output as _logicAPI_TournamentAccess__Output } from '../logicAPI/TournamentAccess';

export interface TeamAdd {
  'access'?: (_logicAPI_TournamentAccess | null);
  'name'?: (string);
}

export interface TeamAdd__Output {
  'access'?: (_logicAPI_TournamentAccess__Output);
  'name'?: (string);
}
