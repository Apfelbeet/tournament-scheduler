export enum ACK_STATUS {
    OK = 0,
    ERROR = 1,
    SYNC_ERROR = 2,
}

export function acknowledge(status: ACK_STATUS, msg: string): {status: Status, message: string} {
    return { status: status, message: msg };
}