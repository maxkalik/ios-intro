import Foundation

class Person {
    // stored properties
    var firstName = ""
    var lastName = ""
    var age = 0
    var gender = ""
    
    // computed properties -> methods
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func greating() -> String {
        return "Hello \(firstName) \(lastName)"
    }
}

// creating a person
let mariana = Person()
mariana.firstName = "Mariana"
mariana.lastName = "Stels"
mariana.age = 26
mariana.gender = "woman"
print(mariana.fullName)         // Mariana Stels
print(mariana.greating())       // Hello Mariana Stels


// This version of the Shape class is missing something important: an initializer to set up the class when an instance is created. Use init to create one.

// Init -> it is like a constructor

class Shape {
    var numberOfSides = 0
    let numbersOfDays = 10

    func simpleDescription() -> String {
        "A shape with \(numberOfSides) sides."
    }

    func getSidesAndDays() -> (sides: Int, days: Int) {
        (numberOfSides, numbersOfDays)
    }
}

var shape = Shape()
print(shape.getSidesAndDays().sides) // 0
print(shape.getSidesAndDays().days)  // 10

shape.numberOfSides = 7
print(shape.simpleDescription())     // A shape with 7 sides.


// Class Initializer
// every class should have initializer -> init() -> compiler knows this method to initialize

class Developer {
    var firstName : String
    var lastName : String
    var salary : Double
    
    init() {
        print("This class has been initialized")
        firstName = ""
        lastName = ""
        salary = 0
    }
}

let dev = Developer() // This class has been initialized
print(dev.salary)     // 0.0


// With arguments in initializer

class User {
    var firstName: String
    var lastName: String
    var age: Int
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        age = 0
    }
    
    // we can make another initializer
    init(first: String, last: String, age: Int) {
        firstName = first
        lastName = last
        self.age = age
    }
}

let pupkin = User(firstName: "Andris", lastName: "Berzins")
print(pupkin.firstName) // Andris

// now User have already 2 initializers
let kalik = User(first: "Max", last: "Kalik", age: 35)
print(kalik.firstName) // Max


// Get and Set, willGet, didSet property observers
class Persona {
    // stored properties
    var firstName: String
    var lastName: String
    var position = "Junior Developer"
    
    var salary : Double {
        // observe methods
        willSet {
            print("value about to change")
            // let's use default swift parameter newValue (alse we can use and oldValue)
            if newValue >= 120000 {
                position = "Senior Developer"
            }
        }
        didSet {
            print("value did change")
        }
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        salary = 150000
    }
    
    // computed properties -> methods
    var monthlySalary: Double {
        get {
            // called when accessing variable
            return salary / 12
        }
        set {
            // called when setting the variable value
            salary = newValue * 12
        }
    }
    
    // interesting method to increse prop salary with +=
    // func with internal and external params (inTheAmountOf - external, amount - internal)
    func requestRaise(inTheAmountOf amount: Double) {
        salary += amount
    }
}

let somePersona = Persona(firstName: "Anton", lastName: "Kalik")
print(somePersona.monthlySalary)            // 12500.0
print(somePersona.position)                 // Junior Developer
// value about to change
somePersona.salary = 250000
// value did change
print(somePersona.monthlySalary)            // 20833.333333333332
print(somePersona.position)                 // Senior Developer

somePersona.requestRaise(inTheAmountOf: 10000)
print(somePersona.monthlySalary)            // 21833.333333333332 (20833 + 10000)


// Inheritence

class Hero {

    var heroName : String
    var heroAge : Int
    
    init(name: String, age: Int) {
        heroName = name
        heroAge = age
    }
}

class Warrior: Hero {
    
    var attackSkill = 50
    var defenceSkill = 15
    
    init(name: String, age: Int, attackSkill: Int, defenceSkill: Int) {
        super.init(name: name, age: age)
        self.attackSkill =  attackSkill
        self.defenceSkill = defenceSkill
    }
    
    func attack() {
        attackSkill += 5
    }
}

let someWarrior = Warrior(name: "Maximus", age: 25, attackSkill: 100, defenceSkill: 25)
print(someWarrior.heroName)         // Maximus
print(someWarrior.attackSkill)      // 100
someWarrior.attack()
print(someWarrior.attackSkill)      // 105


class WarriorMonk : Warrior {
    
    var intelligence = 200
    
    init(name: String, age: Int, attackSkill: Int, defenceSkill: Int, weaponIq: Int) {
        super.init(name: name, age: age, attackSkill: attackSkill, defenceSkill: defenceSkill)
        intelligence = weaponIq;
    }
    
    override func attack() {
        attackSkill += 10
    }
}

let someMonk = WarriorMonk(name: "Lucius", age: 43, attackSkill: 5, defenceSkill: 50, weaponIq: 300)

print(someMonk.heroName)            // Lucius
print(someMonk.attackSkill)         // 5
someMonk.attack()
print(someMonk.attackSkill)         // 15
