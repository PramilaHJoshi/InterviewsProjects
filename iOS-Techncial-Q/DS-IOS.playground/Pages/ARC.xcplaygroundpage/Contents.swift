//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


class Person {
    var name: String
    //var age: Int
    
    init(name: String) {
        self.name = name
        //self.age = age
       // print("\(name) initialized with reference count: \(MemoryManager.shared.referenceCount(for: self))")
    }
    var apartment: Apartment?
    
    deinit {
       // print("\(name) deinitialized with reference count: \(MemoryManager.shared.referenceCount(for: self))")
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

print(john!.apartment, unit4A!.tenant)


// A custom memory manager class to simulate reference counting (for illustration purposes only)
//class MemoryManager {
//    static let shared = MemoryManager()
//    
//    private init() {}
//    
//    func referenceCount(for object: AnyObject) -> Int {
//        // Simulated reference count. In reality, Swift does not expose this information.
//        return 1 // Stubbed return value.
//    }
//}

//// Create a reference to a Person instance
//var person1: Person? = Person(name: "Alice", age: 30)
//
//// Create another reference to the same Person instance
//var person2 = person1
//
//var person3 = person2
//
//// At this point, the instance has a reference count of 2
//print("References to Alice: \(MemoryManager.shared.referenceCount(for: person1!)), \(MemoryManager.shared.referenceCount(for: person2!)), \(MemoryManager.shared.referenceCount(for: person3!))")
//
//person1 = nil
//
//print("References to Alice: \(MemoryManager.shared.referenceCount(for: person2!)), \(MemoryManager.shared.referenceCount(for: person3!))")
//
//person2 = nil
//
//print("References to Alice: \(MemoryManager.shared.referenceCount(for: person3!))")
//
//person3 = nil
