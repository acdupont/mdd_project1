module creator

sig Name, Birthdate {}

// We want a specific number of ages and ranks
enum AgeRange { A0, A1, A2, A3, A4 }
enum Rank { R0, R1, R2, R3, R4 } 

abstract sig Person {
    name: one Name
}

sig Guardian extends Person {}

abstract sig Player {
    name: one Name,
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
    // Method to control which Players are valid (relation to age group)
}

// Teams Creator class
//   - Method that takes set of Players and creates Teams based on their AgeRange and Rank

pred test {}

run test
