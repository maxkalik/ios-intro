// Swift Closures
// Closures are self-contained blocks of functionality that can be passed around and used in your code.

// function type = (Int, Int) -> Int
func addTwoNumber(a: Int, b: Int) -> Int {
  return a + b
}

// function type = (Int, Int) -> Int
func multiplyTwoNumber(a: Int, b: Int) -> Int {
  return a * b
}

typealias OperationComplition = (Int, Int) -> Int

func doMath(a: Int, b: Int, operation: OperationComplition) {
  print(operation(a, b)) // 8
}

doMath(a: 2, b: 4, operation: multiplyTwoNumber(a:b:)) // 8

// Closure expression
doMath(a: 2, b: 4, operation: { (a: Int, b: Int) -> Int in return a * b }) // 8

// Inffering (returning) type from context
doMath(a: 2, b: 4, operation: { a, b -> Int in return a + b }) // 6

// Implicit returns from single expression
doMath(a: 2, b: 4, operation: { a, b -> Int in a + b }) // 6

// Shorthand argument names
doMath(a: 2, b: 4, operation: { $0 - $1 }) // -2

// Trailing closure
doMath(a: 2, b: 4) { $0 - $1 } // -2


// example from sorting arr.sorted { $0.name < $1.name }

let names = ["Anton", "Ilze", "Max", "Liene", "Karina"]
var sorted: [String]
sorted = names.sorted{$0 < $1}
sorted = names.sorted(by: { $0 < $1 })
sorted = names.sorted(by: { stringOne, stringTwo in stringOne < stringTwo })
sorted = names.sorted(by: { stringOne, stringTwo in return stringOne < stringTwo })
sorted = names.sorted(by: { stringOne, stringTwo in return stringOne < stringTwo })
sorted = names.sorted(by: {(stringOne: String, stringTwo: String) -> Bool in return stringOne < stringTwo })

func sortNames(stringOne: String, stringTwo: String) -> Bool {
  return stringOne < stringTwo
}

sorted = names.sorted(by: sortNames(stringOne:stringTwo:))

print(sorted) // ["Anton", "Ilze", "Karina", "Liene", "Max"]

let numbers = [1,2,3,4,5]
 
var incremented: [Int]
incremented = numbers.map{$0 + 1}

// detailed
func incrementByOne(firstInt: Int) -> Int {
  return firstInt + 1
}
incremented = numbers.map(incrementByOne)

print(incremented) // [2, 3, 4, 5, 6]



struct User {
    var name: String
    var age: Int
    var address: String
    
    static func modelToData(data: User) -> [String: Any] {
        return [
            "name": data.name,
            "age": data.age,
            "address": data.address
        ]
    }
}

// Classic Clousure
// typealias TaskComplition = ([String: Any]) -> Any
func taskWithComplition(data: User, method: String, with complition: ([String: Any]) -> Void) {
    let result = User.modelToData(data: data)
    print("Your request has been seccessfuly sent. Method:", method)
    complition(result)
}

let userAnton = User(name: "Anton", age: 35, address: "LA, CA")

taskWithComplition(data: userAnton, method: "POST") { (result) -> Void in
    print(result)
    // Your request has been seccessfuly sent. Method: POST
    // ["address": "LA, CA", "age": 35, "name": "Anton"]
}


// @Escaping

// A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns (when the parameter-func is outside of the main func)
// As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn’t called until the operation is completed—the closure needs to escape, to be called later.

typealias UserComplition = (String) -> Void

class UserApi {
    var complition: UserComplition
    var userName: String

    init(_ userName: String, complition: @escaping UserComplition) {
        self.userName = userName
        self.complition = complition
        print("3. Network request completed")
    }
}

class ViewController {

    func buttonTapped() {
        print("1. Request just started")
        UserApi("maxkalik") { userName in
            print(userName)
        }
    }
}

var vcInstance = ViewController()
vcInstance.buttonTapped()