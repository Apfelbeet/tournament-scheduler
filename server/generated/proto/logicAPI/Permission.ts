// Original file: ../proto/logic_api.proto

import type { PERMISSION as _logicAPI_PERMISSION } from '../logicAPI/PERMISSION';

export interface Permission {
  'permission'?: (_logicAPI_PERMISSION | keyof typeof _logicAPI_PERMISSION);
}

export interface Permission__Output {
  'permission'?: (_logicAPI_PERMISSION);
}
