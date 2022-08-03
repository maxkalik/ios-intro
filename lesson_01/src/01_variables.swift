import Foundation

print("Hello World")
var greeting = "Hello, playground"
print(greeting)

// The program runs line by line, from top to bottom:
// Output:
// Hello World
// Hello, playground

// Variables

// Arithmetic Operations
var score = 10           // 10
var x = 15 + 5           // 20
let result = score + x   // 30

x = 18                   // can change
// result = 20           // can't cange

// Type can be used during declaration
var age: Int = 28
var price: Double = 7.55
var message: String = "Good night"
var lateToWork: Bool = true

// String Interpolation
var plates = 4
print("There are \(plates) plates on the table")
// Prints: There are 4 plates on the table

// Compound Assignment Operators
plates += 1
print("There are \(plates) plates on the table")
// Prints: There are 5 plates on the table
