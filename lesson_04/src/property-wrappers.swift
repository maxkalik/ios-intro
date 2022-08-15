// Property Wrappers (Decorators)
/* property wrapper syntax is just syntactic sugar */

// for example, in observer didSet we arrange some logic
// if an object grows and scales then we can wrap it into the property wrapwers

@propertyWrapper
struct TwelveOrLess {
  private var number: Int
  init() { self.number = 0 }
  // required "wrappedValue"
  var wrappedValue: Int {
    get { return number }
    set { number = min(newValue, 12) } // automatic created - newValue
  }
}

struct SmallRectangle {
  @TwelveOrLess var width: Int
  @TwelveOrLess var height: Int
}

var rectangle = SmallRectangle()

print(rectangle.height) // 0

rectangle.height = 10
print(rectangle.height) // 10

rectangle.height = 20
print(rectangle.height) // 12


print("-------------------------------------")
// Explicitly

struct SmallBox {
  private var _height = TwelveOrLess() // property _height stores an instance of TwerlveOrLess
  private var _width = TwelveOrLess() // property _width stores an instance of TwerlveOrLess

  var height: Int {
    get { return _height.wrappedValue }
    set { _height.wrappedValue = newValue }
  }
  var width: Int {
    get { return _width.wrappedValue }
    set { _width.wrappedValue = newValue }
  }
}

var box = SmallBox()

print(box.height) // 0
box.height = 24
print(box.height) // 12


print("-------------------------------------")
// With Initializers

@propertyWrapper
struct SmallNumber {
  private var maximum: Int
  private var number: Int
  
  var wrappedValue: Int {
    get { return number }
    set { number = min(newValue, maximum) }
  }

  // initializing default values
  init() {
    maximum = 12
    number = 0
  }

  init(wrappedValue: Int) {
    maximum = 12
    number = min(wrappedValue, maximum)
  }

  init(wrappedValue: Int, maximum: Int) {
    self.maximum = maximum
    number = min(wrappedValue, maximum)
  }
}

struct ZeroRectangle {
  @SmallNumber var height: Int
  @SmallNumber var width: Int
}

var zeroRect = ZeroRectangle()
print(zeroRect.height, zeroRect.width) // 0 0

// initialize default values in
struct UnitRectangle {
  @SmallNumber var height: Int = 1
  @SmallNumber var width: Int = 1
}

var unitRect = UnitRectangle()
print(unitRect.height, unitRect.width) // 1 1


// initialize using struct initializer (one of them)

struct NarrowRectangle {
  @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
  @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRect = NarrowRectangle()
print(narrowRect.height, narrowRect.width) // 2 3

narrowRect.height = 100
narrowRect.width = 100
print(narrowRect.height, narrowRect.width) // 5 4


print("-------------------------------------")
// Projecting a Value From a Property Wrapper

@propertyWrapper
struct LargeNumber {
  private var number: Int
  var projectedValue: Bool
  
  init() {
    self.number = 35
    self.projectedValue = false
  }
  
  var wrappedValue: Int {
    get { return number }
    set {
      if newValue < 12 {
        number = 12
        projectedValue = true
      } else {
        number = newValue
        projectedValue = false
      }
    }
  }
}

struct SomeStructure {
  @LargeNumber var someNumber: Int
}

var someStruct = SomeStructure()

print(someStruct.someNumber) // 35

someStruct.someNumber = 25
print(someStruct.someNumber) // 25
print(someStruct.$someNumber) // false

someStruct.someNumber = 7
print(someStruct.someNumber) // 12
print(someStruct.$someNumber) // true