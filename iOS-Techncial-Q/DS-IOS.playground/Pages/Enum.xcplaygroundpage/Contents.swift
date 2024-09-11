//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//ENUM

///Iterating over Enumeration Cases
///
enum Beverage: CaseIterable {
    case coffe, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"
for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice

//Associated Values

enum TransportMode {
    case car(seats: Int)
    case bicycle(hasBasket: Bool)
    case bus(numberOfPassengers: Int)
    case airplane(model: String, passengers: Int)
}
//Usage
let myCar = TransportMode.car(seats: 4)
let myBicycle = TransportMode.bicycle(hasBasket: true)
let cityBus = TransportMode.bus(numberOfPassengers: 30)
let boeing737 = TransportMode.airplane(model: "Boeing 737", passengers: 180)
/*
 Why Use Associated Values?
 Flexibility: Each case can carry different types and quantities of data, allowing enums to represent a wide range of scenarios.
 Safety: The data associated with each case is tightly coupled to the case itself, reducing the chance of errors.
 Clarity: Code that uses enums with associated values is often more readable and expressive, clearly showing the intent of each case
 */
//Live Example
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var upc = Barcode.upc(1, 4, 6, 6)
upc = .qrCode("ANBVGCBJNBBD")

enum NetworkResponse {
    case success(data: Data)
    case failure(error: Error)
}
func handleResponse(_ response: NetworkResponse) {
    switch response {
    case .success(let data):
        print("Received data: \(data)")
    case .failure(let error):
        print("Failed with error: \(error.localizedDescription)")
    }
}

//What Does "First-Class Type" Mean?
   ///A first-class type in a programming language is a type that:
   ///Can have properties and methods.
   ///Can conform to protocols.
  ///Can be extended to add new functionality.
  ///Can be used as types in function parameters or return values.

//Methods and Computed Properties
enum Beverage: String {
    case coffee = "Coffee"
    case tea = "Tea"
    case juice = "Juice"
    
    func description() -> String {
        return "You chose \(self.rawValue)."
    }
    
    var description: String {
        return "You chose \(self.rawValue)."
    }
    
    var isHot: Bool {
        return self == .coffee || self == .tea
    }
}

let myBeverage = .coffee
print(myBeverage.description())  // Output: You chose Coffee.

//Protocol Conformance
   ///Enums can conform to protocols, just like classes and structs. This means they can adopt standard behaviors, making them more versatile and reusable.
protocol Describable {
    func description() -> String
}
enum Beverage: String, Describable {
    case coffee = "Coffee"
    case tea = "Tea"
    case juice = "Juice"
    
    func description() -> String {
        return "You chose \(self.rawValue)."
    }
}

//Extensibility
  ///Enums in Swift can be extended to add new methods, computed properties, or even conformances to additional protocols. This makes it possible to enhance their functionality without modifying the original enum definition.
extension Beverage {
    var isHot: Bool {
        return self == .coffee || self == .tea
    }
}

let beverage = Beverage.tea
print(beverage.isHot)  // Output: true

//Custom Initializers

enum Beverage: String {
    case coffee = "Coffee"
    case tea = "Tea"
    case juice = "Juice"
    
    init?(identifier: String) {
        switch identifier.lowercased() {
        case "coffee":
            self = .coffee
        case "tea":
            self = .tea
        case "juice":
            self = .juice
        default:
            return nil
        }
    }
    
    func description() -> String {
        return "You chose \(self.rawValue)."
    }
}

if let beverage = Beverage(identifier: "tea") {
    print(beverage.description())  // Output: You chose Tea.
}

//Note: enum can support
        /// Cases Without Raw Values,
       /// Cases with Raw Values
/// Associated Values:
/// Methods:
/// Computed Properties:
/// Protocol Conformance:
/// Initializers:
/// Extensions:

//Enums in Swift Do Not Support: Stored Properties:
// This is not allowed:
///Inheritance:
///Deinitializers:
///Mutability of Cases:
///Subscripts:
enum Beverage {
    case coffee
    var size: Int = 12  // Error: Enums cannot have stored properties
}
