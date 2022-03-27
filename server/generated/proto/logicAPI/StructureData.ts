// Original file: ../proto/logic_api.proto

import type { Stats as _logicAPI_Stats, Stats__Output as _logicAPI_Stats__Output } from '../logicAPI/Stats';

export interface StructureData {
  'id'?: (number);
  'type'?: (string);
  'label'?: (string);
  'visible'?: (boolean);
  'state'?: (number);
  'stats'?: (_logicAPI_Stats)[];
  'data'?: (string);
  'modules'?: (number)[];
  'games'?: (number)[];
  'down'?: (number)[];
  'up'?: (number)[];
}

export interface StructureData__Output {
  'id'?: (number);
  'type'?: (string);
  'label'?: (string);
  'visible'?: (boolean);
  'state'?: (number);
  'stats'?: (_logicAPI_Stats__Output)[];
  'data'?: (string);
  'modules'?: (number)[];
  'games'?: (number)[];
  'down'?: (number)[];
  'up'?: (number)[];
}
