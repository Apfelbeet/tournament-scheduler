export class OutOfSyncError extends Error {
    constructor() {
        super("Out of Sync!");
        this.name = this.constructor.name;
        Error.captureStackTrace(this, this.constructor);
    }
}

export class UserInputError extends Error {
    constructor(msg: string) {
        super(`Invalid input: ${msg}`);
        this.name = this.constructor.name;
        Error.captureStackTrace(this, this.constructor);
    }
}