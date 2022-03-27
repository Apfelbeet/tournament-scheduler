// Original file: ../proto/logic_api.proto

import type { TournamentDetailsList as _logicAPI_TournamentDetailsList, TournamentDetailsList__Output as _logicAPI_TournamentDetailsList__Output } from '../logicAPI/TournamentDetailsList';

export interface ServerEvent {
  'tournaments'?: (_logicAPI_TournamentDetailsList | null);
  'error'?: (string);
  'event'?: "tournaments"|"error";
}

export interface ServerEvent__Output {
  'tournaments'?: (_logicAPI_TournamentDetailsList__Output);
  'error'?: (string);
}
