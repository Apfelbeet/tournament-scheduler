import { Module } from "../logic/generation_modules/module";

export type Key = string;
export type TeamId = number;
export type Sync = string;

export type Team = {
    name: string;
    id: TeamId;
};

export type Mode = {
    id: number;
    title: string;
    description: string;
    init: typeof Module;
};

export type UnparsedMode = {
    id: number;
    title: string;
    description: string;
    init: string;
}

export type UnparsedConfiguration = {
    port: number;
    database: {
        host: string,
        port: number,
    }
    lexicon: string;
    modes: UnparsedMode[];
    logTags: LogType[];
}

export type Lexicon = Map<String, typeof Module>;

export type Configuration = {
    port: number;
    database: {
        host: string,
        port: number,
    };
    lexicon: Lexicon;
    modes: Mode[];
    logTags: LogType[];
};

export type UnparsedLexiconEntry = {
    type: string;
    file: string;
}

export type LogType = "info" | "warning" | "error" | "always" | "network" | "database" | "debug"