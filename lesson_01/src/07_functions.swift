import Foundation

// Void function - returns nothing

func doSomething() -> Void {
    print("do something")
}

doSomething() // do something

// Function returns value

let birthYear = 1994
var currentYear = 2022

func findAge() -> Int {
    return currentYear - birthYear
}

print(findAge()) // 28

// Parameters

func calculate(num1: Int, num2: Int) -> Int {
    num1 + num2
}
print(calculate(num1: 5, num2: 3)) // 8

func getFullName(_ firstName: String, _ lastName: String) -> String {
    "\(firstName) \(lastName)"
}
print(getFullName("Maksim", "Kalik")) // Maksim Kalik

func doSomethingWithDefaultValue(_ defaultValue: Int = 10) -> Int {
    defaultValue + 10
}
print(doSomethingWithDefaultValue())   // 20
print(doSomethingWithDefaultValue(15)) // 25

// Variadic Parameters

func totalStudents(students: String...) -> Int {
    let numStudents = students.count
    return numStudents
}

print(totalStudents(students: "Jamie", "Michael", "Rose", "Idris")) // Prints: 4

// In-Out Parameters

var currentSeason = "Winter"

func determineSeason(monthNum: Int, season: inout String) {
    switch monthNum {
    case 1...2:
        season = "Winter ⛄️"
    case 3...6:
        season = "Spring 🌱"
    case 7...9:
        season = "Summer ⛱"
    case 10...11:
        season = "Autumn 🍂"
    default:
        season = "Unknown"
    }
}

determineSeason(monthNum: 4, season: &currentSeason)
print(currentSeason) // Spring 🌱
