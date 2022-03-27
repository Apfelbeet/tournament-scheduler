// Original file: ../proto/logic_api.proto


// Original file: ../proto/logic_api.proto

export enum _logicAPI_Acknowledgment_Status {
  OK = 0,
  ERRROR = 1,
  SYNC_ERROR = 2,
}

export interface Acknowledgment {
  'status'?: (_logicAPI_Acknowledgment_Status | keyof typeof _logicAPI_Acknowledgment_Status);
  'message'?: (string);
}

export interface Acknowledgment__Output {
  'status'?: (_logicAPI_Acknowledgment_Status);
  'message'?: (string);
}
