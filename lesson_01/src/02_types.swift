import Foundation

// Int, Double, Float

var age: Int = 28         // On a 32-bit platform, Int is the same size as Int32.
                          // On a 64-bit platform, Int is the same size as Int64.
var price: Double = 7.55  // Double represents a 64-bit floating-point number.
var y: Float = 100.5      // Float represents a 32-bit floating-point number.

var x: Double = 55.3
var height: Int = 10

// print(x + height)      // Binary operator '+' cannot be applied to operands of type 'Double' and 'Int'
print(x + Double(height)) // Prints: 65.3


// String, Character

let message: String = "Some message"
let char = message.first  // String.Element where Element is Character
let someChar = "z"


// Tuples
let http404Error: (Int, String) = (404, "Not Found")
print(http404Error.0, http404Error.1)
// Prints: 404 Not Found

let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
// Prints: "The status code is 404"

print("The status message is \(statusMessage)")
// Prints: "The status message is Not Found"


// Type Aliases
typealias HTTPError = (Int, String)
let http500Error: HTTPError = (500, "Internal Server Error")
