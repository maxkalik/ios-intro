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

// Switch Statement: Interval Matching

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

// Prints: "There are dozens of moons orbiting Saturn."

// Switch Statement: Compound Cases

let service = "DoorDash"

switch service {
case "Uber", "Bolt":
    print("Taxi")
case "Bolt Food", "DoorDash", "Wolt":
    print("Food delivery")
case "UPS", "DHL":
    print("Delivery")
default:
    print("Unknown service")
}

// Prints: Restaurant delivery

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin") // On an axis, 9 from the origin
default:
    print("Not on an axis")
}


// Fallthrough

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description) // The number 5 is a prime number, and also an integer.


// Logical operations are like everywhere

print(!true)          // false
print(!false)         // true
print(true && true)   // true
print(true && false)  // false
print(false || true)  // true
print(false || false) // false

// Parentheses

print(true || true && false || false)     // true
print((true || true) && (false || false)) // false
