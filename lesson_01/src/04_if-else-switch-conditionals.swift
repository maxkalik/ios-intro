import Foundation

// If / Else Statement

let a: Int = 10
var b: Int = 20

if a > b {
  print("A greather then B")
} else {
  print("B greather then A")
}

// Prints: B greather then A

b = 10

if a > b {
  print("A greather then B")
} else if a < b {
  print("B greather then A")
} else {
  print("A and B are equal")
}

// Prints: A and B are equal

// Ternary Conditional Operator

a == b ? print("A equals B") : print("A doesn't equal B") 
 
// Prints: A equals B

// Switch Statement

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

// Prints: "The last letter of the alphabet"

// Interval Matching

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

// Prints "There are dozens of moons orbiting Saturn."