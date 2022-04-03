// Original file: ../proto/logic_api.proto

import type { PERMISSION as _logicAPI_PERMISSION } from '../logicAPI/PERMISSION';

export interface KeyPermissionPair {
  'key'?: (string);
  'permission'?: (_logicAPI_PERMISSION | keyof typeof _logicAPI_PERMISSION);
}

export interface KeyPermissionPair__Output {
  'key'?: (string);
  'permission'?: (_logicAPI_PERMISSION);
}
