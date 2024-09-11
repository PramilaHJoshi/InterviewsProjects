//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//OpaqueTye

protocol Animal {
    func speak() -> String
}

struct Dog: Animal{
    func speak() -> String {
        return "Bow!"
    }
}

struct Cat: Animal {
    func speak() -> String {
        return "Mhew!"
    }
}

func getAnimal() -> Animal {
    return Cat()
}

let animal = getAnimal()
print(animal.speak())  // Outputs: Woof!


//StringProtocol
//AdditiveArithmetic
//Comparable
//Equatable

protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
}
extension String: Addable {
    // For `String`, only the `+` operator makes sense.
    static func -(lhs: String, rhs: String) -> String {
        // Example implementation (not really meaningful for String)
        return lhs.replacingOccurrences(of: rhs, with: "")
    }
    
    static func *(lhs: String, rhs: String) -> String {
        // Repeating the string for demonstration
        return String(repeating: lhs, count: rhs.count)
    }
    
    static func /(lhs: String, rhs: String) -> String {
        // Just return the original string for demonstration (not a valid operation)
        return lhs
    }
}
extension Double: Addable {}
extension Int: Addable {}


func addValues<U: Addable>(_ a: U, _ b: U) -> U {
    return a + b
}

func subtractValues<U: Addable>(_ a: U, _ b: U) -> U {
    return a - b
}

func multiplyValues<U: Addable>(_ a: U, _ b: U) -> U {
    return a * b
}

func divideValues<U: Addable>(_ a: U, _ b: U) -> U {
    return a / b
}

// Int
let sumInt = addValues(2, 1)
let diffInt = subtractValues(2, 1)
let productInt = multiplyValues(2, 1)
let quotientInt = divideValues(2, 1)
print("Int: \(sumInt), \(diffInt), \(productInt), \(quotientInt)")

// String
let sumString = addValues("Hello", "World")
let diffString = subtractValues("HelloWorld", "World")
let productString = multiplyValues("Hello", "World")
let quotientString = divideValues("Hello", "World")
print("String: \(sumString), \(diffString), \(productString), \(quotientString)")

// Double
let sumDouble = addValues(2.14, 3.14)
let diffDouble = subtractValues(2.14, 1.14)
let productDouble = multiplyValues(2.14, 3.14)
let quotientDouble = divideValues(3.14, 2.14)
print("Double: \(sumDouble), \(diffDouble), \(productDouble), \(quotientDouble)")

//Equatable

func areEqual<U: Comparable>(_ a: inout U, _ b: inout U) -> Bool {
    return (a > b)
}






