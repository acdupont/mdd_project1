module creator

enum Gender { MALE, FEMALE }

abstract sig Person {
    gender: one Gender
}

abstract sig Player extends Person {}

sig MalePlayer extends Player {}
sig FemalePlayer extends Player {}

// Basic team setup
sig Team {
    malePlayers: set MalePlayer,
	femalePlayers: set FemalePlayer
}

one sig League {
	teams: set Team
}

// Four teams are in the league
fact {
	one l: League | #l.teams = 4
}

// All teams are in the league
fact {
	all t: Team | one l: League | t in l.teams
}

// Players can only be in one team
fact {
    all p: Player | one t : Team | p in getPlayers[t]
}

fact {
	all t: Team | #t.malePlayers = 2
}

fact {
	all t: Team | #t.femalePlayers = 2
}

fact {
	all m: MalePlayer | m.gender = MALE
}

fact {
	all f: FemalePlayer | f.gender = FEMALE
}

// Returns whether or not a player is a male
pred isMale (p: Player) {
    p.gender = MALE
}

// Returns whether or not a player is a female
pred isFemale (p: Player) {
    p.gender = FEMALE
}

// Function to return the set of players on the team
fun getPlayers (t: Team) : set Player {
	t.malePlayers + t.femalePlayers
}

// Function to count the amount of males on a team
fun countMale (t: Team) : Int {
    #t.malePlayers
}

// Function to count the amount  of females on a team
fun countFemales (t: Team) : Int {
   #t.femalePlayers
}

pred test {}

run test for 20
