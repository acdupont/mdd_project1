module creator

sig Name, Address {}

// We want a specific number of ages and ranks
enum AgeRange { A0, A1, A2, A3, A4 }
enum Rank { R0, R1, R2, R3, R4 } 

// Set fields for Players
abstract sig Player {
	name: one Name,
	addrs: one Address,
	age: one AgeRange,
	rank: one Rank
}

// We can have male or female players
sig MalePlayer extends Player {}
sig FemalePlayer extends Player {}

// Basic team setup
sig Team {
	players: some Player,
	setAge: one AgeRange,
	targetRank: one Rank
}

pred test {}

run test
