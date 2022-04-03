export class OutOfSyncError extends Error {
    constructor() {
        super("Out of Sync!");
        this.name = this.constructor.name;
        Error.captureStackTrace(this, this.constructor);
    }
}

export class PermissionError extends Error {
    constructor() {
        super("Permission denied!");
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

export class UnknownTournamentError extends Error {
    constructor() {
        super(`Tournament doesn't exist!`);
        this.name = this.constructor.name;
        Error.captureStackTrace(this, this.constructor);
    }
}