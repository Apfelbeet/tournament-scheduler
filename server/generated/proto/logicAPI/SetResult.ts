// Original file: ../proto/logic_api.proto

import type { TournamentAccess as _logicAPI_TournamentAccess, TournamentAccess__Output as _logicAPI_TournamentAccess__Output } from '../logicAPI/TournamentAccess';
import type { GameData as _logicAPI_GameData, GameData__Output as _logicAPI_GameData__Output } from '../logicAPI/GameData';

export interface SetResult {
  'access'?: (_logicAPI_TournamentAccess | null);
  'game'?: (_logicAPI_GameData | null);
}

export interface SetResult__Output {
  'access'?: (_logicAPI_TournamentAccess__Output);
  'game'?: (_logicAPI_GameData__Output);
}
