import { readFileSync } from "fs";
import { Configuration, UnparsedMode, Mode, UnparsedConfiguration } from "../types/general_types";
import { Module } from "./generation_modules/module";

let config: Configuration;
//let onLoad: (() => void)[];

export async function refresh() {
    let raw: string = readFileSync("server_config.json", "utf8");
    const temp: UnparsedConfiguration = JSON.parse(raw);
    config = {
        port: temp.port,
        modes: await Promise.all(temp.modes.map(async (m: UnparsedMode) => {
            return {
                id: m.id,
                title: m.title,
                description: m.description,
                init: (await import(m.init)) as (typeof Module),
            } as Mode;
        }))
    }
    //notify();
}

export function getPort() {
    return config.port;
}

export function getModes(): Mode[] {
    return config.modes;
}

// export function subscribe(fn: ()=>void, initCall = false) {
//     onRefresh.push(fn);

//     //Do inital call regardless of any update. 
//     if (initCall) {
//         fn();
//     }
// }

// export function notify() {
//     onRefresh.forEach((fn) => fn());
// }

refresh();