import Foundation

// For loop

for char in "string" {
    print(char)
}

// Prints: s t r i n g

// break
for char in "supercalifragilisticexpialidocious" {
    if char == "c" {
        break
    }
    print(char)
}

// Prints: s u p e r


// Ranges ...

let zeroToThreeRange = 0...3

for i in zeroToThreeRange {
    print(i)
}

// Prints: 0 1 2 3


// While loop

var counter = 1
var stopNum = Int.random(in: 1...10)

while counter < stopNum {
    print("counter", counter)
    counter += 1
}


/*
 
 Prints:
 
 counter 1
 counter 2
 counter 3
 counter 4
 counter 5
 counter 6
 counter 7
 counter 8
 counter 9
 
 */

// Iterating over an array

var names = ["Sandris", "Ilze", "Uldis", "Zane", "Rihard"]
for name in names {
    print(name)
}

/*
 
 Prints:
 
 Sandris
 Ilze
 Uldis
 Zane
 Rihard
 
 */


// Iterating over a Dictionary

var primaryHex = [
    "red": "#ff0000",
    "yellow": "#ffff00",
    "blue": "#0000ff",
]

// Iterate through both keys and values
for (color, code) in primaryHex {
    print("\(color) has '\(code) code'")
}
/*
 
 Prints:
 
 blue has '#0000ff code'
 red has '#ff0000 code'
 yellow has '#ffff00 code'
 
*/

// Iterate only through keys
for color in primaryHex.keys {
    print(color)
}
/*

 Prints:
 
 blue
 red
 yellow
 
*/

// Iterate only through values
for code in primaryHex.values {
    print(code)
}

/*

 Prints:
 
 #0000ff
 #ff0000
 #ffff00

*/
