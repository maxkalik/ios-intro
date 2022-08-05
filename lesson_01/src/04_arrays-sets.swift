import Foundation

// Init an array - collection of values of the same data type
var scores = [Int]()
var otherScores: [Int] = []

// Using type inference:
var numbers = [2, 4, 1, 8, 7, 9]

// Explicit type
var temp: [Int] = [33, 31, 30, 38, 44]

// Index
var fruits = ["apple", "peach", "melon", "watermelon"]
print(fruits[1])      // peach
print(fruits.count)   // 4
print(fruits.isEmpty) // false
print(scores.isEmpty) // true

// .append()
fruits.append("kiwi")
print(fruits)
// Prints: ["apple", "peach", "melon", "watermelon", "kiwi"]

// Operator +=
let exotic = ["durian", "mango"]
fruits += exotic
print(fruits)
// Prints: ["apple", "peach", "melon", "watermelon", "kiwi", "durian", "mango"]

// .insert()
fruits.insert("lemon", at: 0)
print(fruits)
// Prints: ["lemon", "apple", "peach", "melon", "watermelon", "kiwi", "durian", "mango"]

// .remove()
fruits.remove(at: 0)
print(fruits)
// Prints: ["apple", "peach", "melon", "watermelon", "kiwi", "durian", "mango"]


// Sets - collection of unique elements of the same data type
// Sets - not ordered

var uniqueWords = Set<String>()
var uniqueIds: Set<String> = []

var uniqueNumbers: Set = [4, 3, 9, 8]

// .insert()
uniqueNumbers.insert(2)
print(uniqueNumbers)
// Print: [3, 4, 9, 2, 8]

uniqueNumbers.insert(4) // (!) we already have this number
print(uniqueNumbers)
// Print: [3, 4, 9, 2, 8]

print(uniqueNumbers.count)         // 5
print(uniqueNumbers.contains(2))   // true

// .remove() - remove an existing element
uniqueNumbers.remove(2)
print(uniqueNumbers)
// Print: [3, 4, 9, 8]


var setA: Set = ["A", "B", "C", "D"]
var setB: Set = ["C", "D", "E", "F"]

// .intersection()
//  - operation populates a new set of elements with the overlapping elements of two sets.
print(setA.intersection(setB))
// Prints: ["D", "C"]

// .union()
//  - operation populates a new set by taking all the values from two sets and combining them.
print(setA.union(setB))
// Prints: ["E", "B", "C", "D", "A", "F"]

// .symmetricDifference()
//  - operation creates a new set with all the non-overlapping values between two sets
print(setA.symmetricDifference(setB))
// Prints: ["A", "E", "B", "F"]

// .subtracting()
//  - removes the values of one second set from another set and stores the remaining values in a new set.
print(setA.subtracting(setB))
// Prints: ["B", "A"]
