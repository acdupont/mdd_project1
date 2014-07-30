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
//   - Method that takes set of Players
//   - Creates Teams based on Age Group of Player, Player rating
// 
// Other relations
//   - Relation of Player to Age Group
//   - Relation of Player to Rating

pred test {}

run test for 4
