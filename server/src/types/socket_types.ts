import { Team } from "./general_types";
import { Structure } from "./module_types";
import { Status } from "./tournament_types";

export type DataTypeString = "team" | "structure" | "status";
export type DataType = Team[] | Structure | Status;
export type ClientMessage = any //TODO
