// Generic functions

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    // Item - generic type - "don't care time" - we don't know exactely in this point which type will be in the array
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

print(makeArray(repeating: "knock", numberOfTimes: 4)) // ["knock", "knock", "knock", "knock"]

// You can make generic forms of functions and methods, as well as classes, enumerations, and structures.

// Generic enum
// Reimplement the Swift standard library's optional type

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

switch possibleInteger {
case .none: // without let because none didn't bind with any variables
    print("None case")
case let .some(wrapped):
    print("It is wrapped: \(wrapped).")
} // It is wrapped: 100.


// Where - to specify a list of requirements

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element // Protocols: Sequence, Equatable
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

print(anyCommonElements([1, 2, 3], [3])) // true
