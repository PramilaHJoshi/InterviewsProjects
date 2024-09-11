//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

class Bicycle: Vehicle {
    // Read-only computed property
        var computedProperty: Int {
            return 42
        }
}
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

class Car: Vehicle {
    des
}

func someMethod() {
    let someVeh = Vehicle()
    print("Vehicle: \(someVeh.description)")
    
    let bicycle = Bicycle()
    bicycle.hasBasket = true
    bicycle.currentSpeed
    
    let tandem = Tandem()
    tandem.hasBasket = true
    tandem.currentNumberOfPassengers = 2
    tandem.currentSpeed = 22.0
    print("Tandem: \(tandem.description)")
    // Tandem: traveling at 22.0 miles per hour
    
}
someMethod()
