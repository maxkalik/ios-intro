import Foundation

struct DevStruct {
    var firstName: String
    var lastName: String
    var salary: Double
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
    // In order to modify the properties of a value type, you have to use the mutating keyword in the instance method
    mutating func requestRaise(inTheAmount amount : Double) {
        salary += amount
    }
}

// struct has already built-in initializer
var devJanis = DevStruct(firstName: "Janis", lastName: "Berzinch", salary: 250000)
print(devJanis) // DevStruct(firstName: "Janis", lastName: "Berzinch", salary: 250000.0)

print(devJanis.salary)              // 250000.0
devJanis.requestRaise(inTheAmount: 80000)
print(devJanis.salary)              // 330000.0 // value has been mutated because of mutating func

// in the rest the struct works in the same way like classes
print(devJanis.fullName())          // Janis Berzinch


// mutating func understanding
struct Stack {
    // This just means that the getter for items is public, but the setter is private
    public private(set) var items = [Int]() // Empty items array
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int? {
        if !items.isEmpty {
            return items.removeLast()
        }
        return nil
    }
}

var stack = Stack()
stack.push(4)
stack.push(78)
print(stack.items) // [4, 78]
_ = stack.pop() // _ = to avoid warning: result of call to 'pop()' is unused
print(stack.items) // [4]


// Structures -> struct
// and difference between class

/*

Struct has no inheritence!
Struct are value types (when class is reference types)

Value types - it is a values in the stuct can be get just coppied

“Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.”


*/
