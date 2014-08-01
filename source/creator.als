module creator

enum Gender { MALE, FEMALE }

abstract sig Person {
    gender: one Gender
}

abstract sig Player extends Person {}

sig MalePlayer extends Player {}
sig FemalePlayer extends Player {}

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

// Players can only be in one team
fact {
    all p: Player | one t : Team | p in getPlayers[t]
}

// Each team has 4 males
fact {
	all t: Team | #t.malePlayers = 4
}

// Each team has 4 females
fact {
	all t: Team | #t.femalePlayers = 4
}

// All MalePlayers are males
fact {
	all m: MalePlayer | isMale [m]
}

// All FemalePlayers are females
fact {
	all f: FemalePlayer | isFemale [f]
}

// No team isn't in the league
assert {
	all t: Team | one l: League | t in l.teams
}

// Every team has the same amount of males as there are females
assert {
	all t: Team | countMales [t] = countFemales [t]
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
fun countMales (t: Team) : Int {
    #t.malePlayers
}

// Function to count the amount  of females on a team
fun countFemales (t: Team) : Int {
   #t.femalePlayers
}

pred test {}

run test for 40
