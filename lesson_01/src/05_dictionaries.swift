import Foundation

// Dictionary - unordered collection of paired data, or key-value pairs.

// Initialization

var yearlyFishPopulation = [Int: Int]()
var yearlyBirdPopulation: [Int: Int] = [:]

var dictionaryName = [
  "Key1": "Value1",
  "Key2": "Value2",
  "Key3": "Value3"
]

// Keys should be unique

dictionaryName["Key4"] = "Value4"
print(dictionaryName)
// Prints: ["Key1": "Value1", "Key2": "Value2", "Key3": "Value3", "Key4": "Value4"]

// Modifing Key-Value Pairs
dictionaryName["Key4"] = "Modified Value4"
print(dictionaryName)
// Prints: ["Key1": "Value1", "Key2": "Value2", "Key3": "Value3", "Key4": "Modified Value4"]

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