// Original file: ../proto/logic_api.proto

import type { TournamentAccess as _logicAPI_TournamentAccess, TournamentAccess__Output as _logicAPI_TournamentAccess__Output } from '../logicAPI/TournamentAccess';
import type { PERMISSION as _logicAPI_PERMISSION } from '../logicAPI/PERMISSION';

export interface SetPermission {
  'access'?: (_logicAPI_TournamentAccess | null);
  'permissionKey'?: (string);
  'permission'?: (_logicAPI_PERMISSION | keyof typeof _logicAPI_PERMISSION);
}

export interface SetPermission__Output {
  'access'?: (_logicAPI_TournamentAccess__Output);
  'permissionKey'?: (string);
  'permission'?: (_logicAPI_PERMISSION);
}
