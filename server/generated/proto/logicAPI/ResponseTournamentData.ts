// Original file: ../proto/logic_api.proto

import type { TournamentData as _logicAPI_TournamentData, TournamentData__Output as _logicAPI_TournamentData__Output } from '../logicAPI/TournamentData';

export interface ResponseTournamentData {
  'data'?: (_logicAPI_TournamentData | null);
  'error'?: (string);
  'response'?: "data"|"error";
}

export interface ResponseTournamentData__Output {
  'data'?: (_logicAPI_TournamentData__Output);
  'error'?: (string);
}
