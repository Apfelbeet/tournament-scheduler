import * as config from "../logic/server_config";
import chalk from 'chalk';
import { LogType } from "../types/general_types";

const tags = new Map<LogType, boolean>()
let loaded = false;

function write(message: string, tag: LogType) {
    if (!loaded || tag == "always" || tags.get(tag)) {
        console.log(new Date().toISOString() + ": " + message);
    }
}

export function log(message: string) {
    write(message, "info");
}

export function warn(message: string) {
    write(chalk.yellow(message), "warning");
}

export function error(message: string) {
    write(chalk.bold.red(message), "error");
}

export function success(message: string) {
    write(chalk.green(message), "info");
}

export function always(message: string) {
    write(message, "always")
}

export function net(message: string) {
    write(message, "network");
}

export function load() {
    loaded = true;
    config.getLoggingTags().forEach((tag: LogType) => tags.set(tag, true))
    log(`Logging tags: ${config.getLoggingTags()}` )
}