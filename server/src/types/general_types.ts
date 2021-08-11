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
    modes: UnparsedMode[];
}

export type Configuration = {
    port: number;
    modes: Mode[];
};
