/*

// Automatic Reference Counting (ARC)

- Reference types (classes, clousures) are stored in the heap
- How does the system know when to reclaim the memory for these from the heap?
- It "counts references" to each of them and when there are zero references ( 3 - 2 - 1 - 0 ) the get tossed automatically.

// Influencing ARC

It is all matters while you are declaring a variables. You can infuence ARC by how you declare a reference-type var with theses keywords (pointers):

strong (default)
weak
unknowed

*/

// Example tracking the number of references (to the new Person)

// Strong reference - default
// - is "normal" reference counting
// - as long as anymore, anywhere has a strong pointer to an instance, it will stay in the heap

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("1. \(name) is being initialized")
    }

    deinit {
        print("2. \(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Max Kalik")
// prints --> 1. Max Kalik is being initialized

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
// ARC does not deallocate the Person instance until the third and final strong reference is broken...
print("ARC does not deallocate Person instance")
reference3 = nil
// prints --> 2. Max Kalik is being deinitialized


// Weak (optional reference pointer)
// - means "if no one else is interested in this, then neither am I, set me to inl in that case"
// - because it has to be nil-able, weak only applies to -> "Optional pointers to reference types"
// - a weak pointer will NEVER keep an objrct in the heap
// - Great example: outlets/delegations (strongly held by the view heirarchy, so outlets can be weak)

// Following example a strong reference cycle causes memory leak
// Weak reference cycle will solve this problem

class User {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: User? // <- it will help to deinitialized User()
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: User?
var unit4A: Apartment?

john = User(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
// John Appleseed is being deinitialized
unit4A = nil
// Apartment 4A is being deinitialized


// Unowned
// - unowned means "don't reference count this; crash if I'm wrong!"
// - This is very raryly used, but usualy only to break memeory cycles between objects (more on that in a moment)
// - we can try to use it in the closures