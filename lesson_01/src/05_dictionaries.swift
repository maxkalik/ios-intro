import Foundation

// Dictionary - unordered collection of paired data, or key-value pairs.

// Initialization

var someDictionary1 = [Int: Int]()
var someDictionary2: [Int: Int] = [:]

var dictionaryName = [
  "Key1": "Value1",
  "Key2": "Value2",
  "Key3": "Value3"
]

print(dictionaryName.isEmpty)           // false
print(someDictionary1.isEmpty)          // true
print(dictionaryName.count)             // 3

// print(dictionaryName["Key2"])        // Optional(Value2)

if let value2 = dictionaryName["Key2"] {
    print(value2)
}
// Prints: Value2

// Keys should be unique

dictionaryName["Key4"] = "Value4"
print(dictionaryName)
// Prints: ["Key1": "Value1", "Key2": "Value2", "Key3": "Value3", "Key4": "Value4"]

// Modifing Key-Value Pairs
dictionaryName["Key4"] = "Modified Value4"
print(dictionaryName)
// Prints: ["Key1": "Value1", "Key2": "Value2", "Key3": "Value3", "Key4": "Modified Value4"]

// .updateValue()
dictionaryName.updateValue("Modified Value3", forKey: "Key3")
print(dictionaryName)
// Prints: ["Key1": "Value1", "Key2": "Value2", "Key3": "Modified Value3", "Key4": "Modified Value4"]

// Remove value by setting key to nil
dictionaryName["Key4"] = nil
print(dictionaryName)
// Prints: ["Key3": "Value3", "Key2": "Value2", "Key1": "Value1"]

// Remove value using .removeValue()
dictionaryName.removeValue(forKey: "Key3")
print(dictionaryName)
// Prints: ["Key2": "Value2", "Key1": "Value1"]
 
// Remove all values
dictionaryName.removeAll()
print(dictionaryName)
// Prints: [:]
