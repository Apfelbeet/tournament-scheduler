export class OutOfSyncError extends Error {
    constructor() {
        super("Out of Sync!");
        this.name = this.constructor.name;
        Error.captureStackTrace(this, this.constructor);
    }
}