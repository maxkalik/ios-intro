// C or Objective-C languages nil means a pointer to a non-existent object
// Swift nil means absense of a value (not set)

var optionalString : String?
// var optional : Optional<String>
// print(optionalString) // nil
// this print cause a warning from compiler

// String       -> just usual string
// String?      -> it's an optional string (it means in a variable you probably couldn't find a value string)

/*
// so an Optional is just an enum - it essentially looks like this
enum Optional<T> {           // a generic type, like Array<Element> or Dictionary<Key, Value>
    case none                // not set - it has a special keyword: nil
    case some(<T>)           // the some case has associated data of type T
}

var hello: String?           // var hello: Optional<String> = .none
var hello: String? = "hello" // var hello: Optional<String> = .some("hello")
var hello: String? = nil     // var hello: Optional<String> = .none

if let greeting = hello {    // switch hello {
    print(greeting)          //     case .some(let data): print(data) 
} else {                     //     case .none: { // do something else}
    // do something else     // }
}
*/

optionalString = "MaxKalik"
// print(optionalString) // Optional("MaxKalik") -> it is wrapping in Optional (why? read above)

// Unwraping force -> we pass to compiler like the variable definetly has a value in there
// using this method is risky

var a : Int?
var b : Int?

a = 4
b = 6

let sum = a! + b! // ! -> exclamation sign means force unwraping because we really know that varables a, b have a value


// Optional Binding -> safe unwraping method
var someString : String?
someString = "Anton Kalik"
// print(someString) // Optional("Anton Kalik")

// Optional Binding
// it is safe because if someString variable would have no value it won't crash. It will return nothing.
if let name = someString {
    // here we can use this string
    print(name) // Anton Kalik // if it won't be value inside someString than it won't print anything
    // but this variable "name" cannot be used outside of "if scope"
}


// guard -> more convinient method

func getSomeString() {
    // guard can be used only inside of a function
    // good practice to use the same names of variables
    guard let someString = someString else { return }
    // more code here
    print(someString)
}
getSomeString() // Anton Kalik // if it won't be value inside someString than it won't print anything

// guard with multiple variables
func getSumOfTwoVars() {
    guard let a = a, let b = b else {
        print("there was not values in either a or b")
        return
    }
    print(a + b)
}
getSumOfTwoVars() // 10 // or if there aren't values than it will print "there was not values in either a or b"


// Nil coalescing (combine) operator
var myName : String? = "Maxim"
print(myName ?? "Anton") // Maxim // it works like "myName" or "Anton"
// we can assign this operator to another value
var actualName = myName ?? "Fred"
print(actualName) // Maxim

var number = a ?? 0
print(number) // 4


// Examples

// var optionalName: String? = "John Apleseed"
var optionalName: String? = nil
var greeting = "somebody!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, there"
}
print(greeting) // Hello, there // because optionalName has no value -> nil