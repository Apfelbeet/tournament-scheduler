import { TeamId } from "./general_types";

export type Status = {
    started: boolean;
    mode: number;
    winner?: TeamId;
};