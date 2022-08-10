// defer (delay return for a while) will be executed last in the function (while the scope exists)

func funcWithDefer() {
    print("1")
    defer { print("2") }
    print("3")
}

funcWithDefer() // 1 3 2


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer { // defer executes the code after all other code in the function, but before func returns
        // you can use defer to write setup and cleanup code
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

var container = fridgeContains("eggs")
print(container) // true // because inside of the func true
print(fridgeIsOpen) // false

func deferTest() -> String {
    var currentString = ""
    currentString += "A"              // 1
    
    defer { currentString += "B" }
    
    if true {
        defer { currentString += "C" }  // 4
        defer { currentString += "D" }  // 3
        currentString += "E"            // 2
    }
    
    currentString += "F"              // 5
    defer { currentString += "G" }
    
    return currentString
}

var test = deferTest()
print(test) // AEDCF
