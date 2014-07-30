module creator

sig Name, Address, AgeRange, Rank {}

abstract sig Player {
	name: one Name,
	addr: one Address,
	age: one AgeRange,
	rank: one Rank
	}

sig MalePlayer extends Player {}
sig FemalePlayer extends Player {}

sig Team {}

pred test {}

run test for 4
