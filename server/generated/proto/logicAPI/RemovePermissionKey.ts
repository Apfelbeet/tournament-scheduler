// Original file: ../proto/logic_api.proto

import type { TournamentAccess as _logicAPI_TournamentAccess, TournamentAccess__Output as _logicAPI_TournamentAccess__Output } from '../logicAPI/TournamentAccess';

export interface RemovePermissionKey {
  'access'?: (_logicAPI_TournamentAccess | null);
  'permissionKey'?: (string);
}

export interface RemovePermissionKey__Output {
  'access'?: (_logicAPI_TournamentAccess__Output);
  'permissionKey'?: (string);
}
