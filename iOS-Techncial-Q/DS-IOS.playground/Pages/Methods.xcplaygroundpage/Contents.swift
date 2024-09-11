//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


//Subscript Syntax

extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

let text = "Hello"

// Step 1: Get the start index of the string
let startIndex = text.startIndex
// Step 2: Calculate the index you want to access (e.g., 1st character after startIndex)
let targetIndex = text.index(startIndex, offsetBy: 0)
// Step 3: Access the character at the calculated index
let letter = text[targetIndex]


struct Week {
    private let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    subscript(index: Int) -> String? {
        return (0..<days.count).contains(index) ? days[index] : nil
    }

    subscript(day: String) -> Int? {
        return days.firstIndex(of: day)
    }
}

let week = Week()
print(week[0])          // Output: "Monday"
print(week["Tuesday"])  // Output: 1

struct Grid {
    var data: [[Int]]
    
    subscript(row: Int, column: Int) -> Int {
        get {
            return data[row][column]
        }
        set {
            data[row][column] = newValue
        }
    }
}

var grid = Grid(data: [[1, 2], [3, 4]])
let value = grid[0, 1]   // Access element at row 0, column 1


var dictionary = ["key1": "value1", "key2": "value2"]
dictionary.updateValue("newValue", forKey: "key2") // Updates the value for "key2"

var dictionary = ["key1": "value1", "key2": "value2"]
dictionary["key2"] = "newValue" // This direct access approach is available in Swift with subscripts


struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

subscript(index: Int) -> Int {
    get {
        // Return an appropriate subscript value here.
    }
    set(newValue) {
        // Perform a suitable setting action here.
    }
}

subscript(index: Int) -> Int {
    // Return an appropriate subscript value here.
}


// Prints "six times three is 18"

//Type Method Objective C VS Swift

// MyClass.h
/*@interface MyClass : NSObject

// Declare a class method
+ (void)classMethod;

@end

// MyClass.m
@implementation MyClass

// Implement the class method
+ (void)classMethod {
    NSLog(@"This is a class method");
}

@end*/

///Usage:
///
//[MyClass classMethod];

//Example for a Class:
class MyClass {
    // Define a class method
    class func classMethod() {
        print("This is a class method")
    }
}

// Usage
MyClass.classMethod()

//Example for a Struct:

struct MyStruct {
    // Define a static method
    static func staticMethod() {
        print("This is a static method")
    }
}

// Usage
MyStruct.staticMethod()

//Example for an Enum:

enum MyEnum {
    // Define a static method
    static func staticMethod() {
        print("This is a static method")
    }
}

// Usage
MyEnum.staticMethod()

//Mutating Keyword
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// Prints "The point is now at (3.0, 4.0)"

struct Point {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
var myPoint = Point(x: 2.0, y: 3.0)
myPoint.moveBy(x: 3.0, y: 4.0)
print(myPoint.x, myPoint.y) // Prints: 5.0, 7.0

class Point {
    var x: Double
    var y: Double

    init(x: Double, y: Double) {
        self.x = x // self.x is the property, x is the parameter
        self.y = y // self.y is the property, y is the parameter
    }
}
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"

//Why is Modification Restricted?
//Swift restricts modification of value types within their instance methods to protect against unintended side effects. Since value types are copied, modifying a copy wouldn't change the original instance. This default behavior helps prevent bugs and unexpected outcomes.



