// PROTOCOLS
// Classes, enumerations, and structs can all adopt protocols.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "Some string..."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}

var a = SimpleClass()
print(a) // main.SimpleClass //
a.adjust() // it is just function call
let aDescription = a.simpleDescription
print(aDescription) // Some string... Now 100% adjusted


print("------------")
// I can do it just with class
class AnotherClass: ExampleProtocol {
    var simpleDescription = "Nothing here for now" // <- this string is required by protocol ExampleProtocol
    var firstProp: String = "firstProp String.."
    func adjust() {
        firstProp += " Adjusted just in class"
    }
}

var anotherClass = AnotherClass()
anotherClass.adjust()
let firstString = anotherClass.firstProp
print(firstString)


print("------------")
// What about struct
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure..."
    
    // Notice the use of the mutating keyword in the declaration of SimpleStructure to mark a method that modifies the structure. The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class
    mutating func adjust() {
        simpleDescription += " Adjusted.."
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print(bDescription) // A simple structure... Adjusted..
