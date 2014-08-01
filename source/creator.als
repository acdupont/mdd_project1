module creator

sig Name, Birthdate {}

// We want a specific number of ages and ranks
enum AgeRange { A0, A1, A2, A3, A4 }
enum Rank { R0, R1, R2, R3, R4 } 

enum Gender { MALE, FEMALE }

abstract sig Person {
    name: one Name,
    gender: one Gender
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
    malePlayers: set MalePlayer,
	femalePlayers: set FemalePlayer
}

// Players can only be in one team
fact {
    all p: Player | one t : Team | p in getPlayers[t]
}

// Returns whether or not a player is a male
pred isMale [p: Player] {
    p.gender = MALE
}

// Returns whether or not a player is a female
pred isFemale [p: Player] {
    p.gender = FEMALE
}

// Function to return the set of players on the team
fun getPlayers [t: Team] : set Player {
	t.malePlayers + t.femalePlayers
}

// Function to count the amount of males on a team
fun countMale [t: Team] : Int {
    #t.malePlayers
}

// Function to count the amount  of females on a team
fun countFemales [t: Team] : Int {
   #t.femalePlayers
}

pred test {}

run test
