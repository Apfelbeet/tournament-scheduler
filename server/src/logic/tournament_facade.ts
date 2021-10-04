import { Tournament } from "./tournament";

export class TournamentFacade {
    
    tournament: Tournament;

    constructor(tournament: Tournament) {
        this.tournament = tournament;
    }
}