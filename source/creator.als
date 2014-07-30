module creator

sig Name, Birthdate, AgeRange, Rank {}

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

sig Team {
    players: set Players
    // Method to control which Players are valid (relation to age group)
}

// Teams Creator class
//   - Method that takes set of Players and creates Teams based on their AgeRange and Rank

pred test {}

run test for 4
