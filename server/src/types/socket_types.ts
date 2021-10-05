import { Team } from "./general_types";
import { Structure } from "./module_types";
import { Status } from "./tournament_types";

export type DataTypeString = "team" | "modules" | "status";
export type DataType = Team[] | Structure[] | Status | undefined;
export type ClientMessage = any //TODO
