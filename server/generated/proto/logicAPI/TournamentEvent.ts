// Original file: ../proto/logic_api.proto

import type { TournamentStatusData as _logicAPI_TournamentStatusData, TournamentStatusData__Output as _logicAPI_TournamentStatusData__Output } from '../logicAPI/TournamentStatusData';
import type { TournamentTeamData as _logicAPI_TournamentTeamData, TournamentTeamData__Output as _logicAPI_TournamentTeamData__Output } from '../logicAPI/TournamentTeamData';
import type { TournamentStructureData as _logicAPI_TournamentStructureData, TournamentStructureData__Output as _logicAPI_TournamentStructureData__Output } from '../logicAPI/TournamentStructureData';

export interface TournamentEvent {
  'key'?: (string);
  'sync'?: (string);
  'syncOld'?: (string);
  'status'?: (_logicAPI_TournamentStatusData | null);
  'teams'?: (_logicAPI_TournamentTeamData | null);
  'structure'?: (_logicAPI_TournamentStructureData | null);
  'error'?: (string);
  'event'?: "status"|"teams"|"structure"|"error";
}

export interface TournamentEvent__Output {
  'key'?: (string);
  'sync'?: (string);
  'syncOld'?: (string);
  'status'?: (_logicAPI_TournamentStatusData__Output);
  'teams'?: (_logicAPI_TournamentTeamData__Output);
  'structure'?: (_logicAPI_TournamentStructureData__Output);
  'error'?: (string);
}
