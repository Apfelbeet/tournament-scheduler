import { readFileSync } from "fs";
import {
    Configuration,
    UnparsedMode,
    Mode,
    UnparsedConfiguration,
    LogType,
    UnparsedLexiconEntry,
    Lexicon,
} from "../types/general_types";
import { Module } from "./generation_modules/module";

let config: Configuration;

export async function refresh() {
    const raw: string = readFileSync("./assets/server_config.json", "utf8");
    const temp: UnparsedConfiguration = JSON.parse(raw);

    //parse lexicon for module generation
    
    const lexicon_input: UnparsedLexiconEntry[] = JSON.parse(
        readFileSync("./assets/" + temp.lexicon, "utf8")
    );
    const lexicon: Lexicon = new Map();

    for (let i = 0; i < lexicon_input.length; i++) {
        const module: typeof Module = (await import(
            "./generation_modules/" + lexicon_input[i].file
        )) as typeof Module;
        lexicon.set(lexicon_input[i].type, module);
    }

    config = {
        port: temp.port,
        database: temp.database,
        lexicon: lexicon,
        modes: temp.modes.map((m: UnparsedMode) => {
                return {
                    id: m.id,
                    title: m.title,
                    description: m.description,
                    init: lexicon.get(m.init),
                } as Mode;
            })
        ,
        logTags: temp.logTags,
    };
}

export function getPort() {
    return config.port;
}

export function getModes(): Mode[] {
    return config.modes;
}

export function getLoggingTags(): LogType[] {
    return config.logTags;
}

export function getLexicon(): Lexicon {
    return config.lexicon;
}

export function getDatabaseConfig(): {port: number, host: string} {
    return config.database;
}
