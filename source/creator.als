module creator

sig Name, Birthdate {}

// We want a specific number of ages and ranks
enum AgeRange { A0, A1, A2, A3, A4 }
enum Rank { R0, R1, R2, R3, R4 } 

abstract sig Person {
    name: one Name
}

sig Guardian extends Person {}

abstract sig Player extends Person {
    birthdate: one Birthdate,
    age: one AgeRange,
    rank: one Rank,
    guardians: set Guardian
}

sig MalePlayer extends Player {}
sig FemalePlayer extends Player {}

// Basic team setup
sig Team {
	setAge: one AgeRange,
	targetRank: one Rank,
    players: set Player
}

// Players can only be in one team
fact {
	all p: Player | one t : Team | p in t.players
}

fact allRanksBelongToSomeTeam {
    all r: Rank | some t: Team | r = t.targetRank
}

fact allAgeRangesBelongToSomeTeam {
    all a:AgeRange | some t:Team | a = t.setAge
}

pred test {}

run test
