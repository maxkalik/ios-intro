# Swift Programming Language

> Tell me about what value types do you know?

> What do you know about null?

## What you will learn

- Varibales
- Types
- Optionals
- if else switch
- Arrays
- Dictionaries
- Loops
- Functions
- Classes
- Structures

- [Swift Documentation](https://docs.swift.org/swift-book/)
- [Apple about Swift](https://developer.apple.com/swift/)
- [Apple Foundation Framework](https://developer.apple.com/documentation/foundation)

## STRUCT / CLASSES

ARC                  -- Automated Reference Counter (memory management) is a compile time feature.
                        Frees the memory only when there are ZERO STRONG references to them

Stack                -- (struct, bool, int ..) static in memory and allocation happens only durring compile time
Heap                 -- (classes) dynamic in memory and allocation happens during runtime. Values can be referenced
                        at anytime through a memory address.

STRUCT                                CLASS
- Value type                          - Reference type
- Copied when passed or assigned      - passed around via pointers
- Copy on write                       - ARC
- use in Func Programming             - Obj-Oriented Programming
- NO inheritence                      - Yes inheritence (single)
- Free init all the vars              - Free init initializes NO vars
- Mutability only vars                - Always mutable