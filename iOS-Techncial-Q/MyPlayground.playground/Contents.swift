import UIKit

var greeting = "Hello, playground"

//Thread and GCD
//Dead Lock2333
// Create serial dispatch queues for database and file system access
let databaseQueue = DispatchQueue(label: "com.example.database")
let fileSystemQueue = DispatchQueue(label: "com.example.filesystem")

// Function to perform database operation
func performDatabaseOperation() {
    databaseQueue.async {
        print("Thread A: Attempting to access the database")
        Thread.sleep(forTimeInterval: 2.0) // Simulating work
        
        // Attempt to access the file system queue
        fileSystemQueue.sync {
            print("Thread A: Attempting to access the file system")
            Thread.sleep(forTimeInterval: 2.0) // Simulating work
            
            // Simulate a deadlock scenario: Thread A tries to access database while holding file system lock
            databaseQueue.sync {
                print("Thread A: Attempting to access the database again")
                Thread.sleep(forTimeInterval: 2.0) // Simulating work
                print("Thread A: Finished accessing the database again")
            }
            
            print("Thread A: Finished accessing the file system")
        }
        
        print("Thread A: Finished accessing the database")
    }
}

// Function to perform file system operation
func performFileSystemOperation() {
    fileSystemQueue.async {
        print("Thread B: Attempting to access the file system")
        Thread.sleep(forTimeInterval: 3.0) // Simulating work
        
        // Attempt to access the database queue
        databaseQueue.sync {
            print("Thread B: Attempting to access the database")
            Thread.sleep(forTimeInterval: 3.0) // Simulating work
            
            // Simulate a deadlock scenario: Thread B tries to access file system while holding database lock
            fileSystemQueue.sync {
                print("Thread B: Attempting to access the file system again")
                Thread.sleep(forTimeInterval: 3.0) // Simulating work
                print("Thread B: Finished accessing the file system again")
            }
            
            print("Thread B: Finished accessing the database")
        }
        
        print("Thread B: Finished accessing the file system")
    }
}

// Simulate the operations
performDatabaseOperation()
performFileSystemOperation()

// Sleep to keep the playground running for enough time to see output
Thread.sleep(forTimeInterval: 15.0)




//1. Using NSLock
//2. Using DispatchSemaphore
//3. Using Serial Dispatch Queue
//RaceArround Codistion
var accountBalance = 100
let serialQueue = DispatchQueue(label: "com.example.accountQueue")

func didload() {
    // Simulate concurrent execution
    DispatchQueue.concurrentPerform(iterations: 2) { index in
        if index == 0 {
            deposit(amount: 50)
        } else {
            withdraw(amount: 30)
        }
    }
}

// Thread 1 (Deposit)
func deposit(amount: Int) {
    serialQueue.sync {
        // Simulate processing delay
        usleep(100)
        let oldValue = accountBalance
        print("Thread 1 - Current Balance: \(oldValue)")
        accountBalance = oldValue + amount
        print("Thread 1 - Depositing \(amount). New Balance: \(accountBalance)")
    }
}

// Thread 2 (Withdraw)
func withdraw(amount: Int) {
    serialQueue.sync {
        // Simulate processing delay
        usleep(100)
        let oldValue = accountBalance
        print("Thread 2 - Current Balance: \(oldValue)")
        accountBalance = oldValue - amount
        print("Thread 2 - Withdrawing \(amount). New Balance: \(accountBalance)")
    }
}

func didLoadData() {
    // Perform a background task
    DispatchQueue.global(qos: .background).async {
        performBackgroundTask()
    }
    
    // Perform a UI update on the main thread
    DispatchQueue.main.async {
        updateUI()
    }
}
didLoadData()

func performBackgroundTask() {
    // Simulate a background task
    Thread.sleep(forTimeInterval: 2.0)
    print("Background task completed")
    
    // Update UI after background task
    DispatchQueue.main.async {
        updateUI()
    }
}

func updateUI() {
    // Update UI elements here
    print("UI updated on main thread")
}


//class Counter {
//    var value: Int = 0
//    
//    func increment() {
//        value += 1
//    }
//}

class Counter {
    private var value: Int = 0
    private let queue = DispatchQueue(label: "com.example.counterQueue")
    
    func increment() {
        queue.sync {
            value += 1
        }
    }
    
    func getValue() -> Int {
        return queue.sync {
            return value
        }
    }
}

let counter = Counter()
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
let group = DispatchGroup()

for _ in 0..<1000 {
    concurrentQueue.async(group: group) {
        counter.increment()
    }
}

group.wait()
print("Final counter value: \(counter.getValue())")





//Question 2: Initialization and Optional Chaining
class Person1 {
    var name: String
    var residence: Residence?
    
    init(name: String) {
        self.name = name
    }
}

class Residence {
    var address: String
    
    init(address: String) {
        self.address = address
    }
}

let john = Person1(name: "John")
john.residence = Residence(address: "123")

let address = john.residence?.address

print(address)

//Question 1: Class Inheritance and Overriding
class Vehicle {
    var brand: String = "Generic"
    
    func honk() {
        print("Honk honk!")
    }
}

class Car: Vehicle {
    var numberOfDoors: Int = 4
    
    override func honk() {
        print("Beep beep!")
    }
}

let myCar: Vehicle = Car()
myCar.honk()


class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dog: Animal {
    var breed: String
    
    init(name: String, breed: String) {
        self.breed = breed
        super.init(name: name)
    }
}

let myDog = Dog(name: "Buddy", breed: "Labrador")

let animal = Animal(name: "Furry")


// Captured Values
class ClassB {
    
    func someMthod() {
        let clsInstance = ClassA()
        clsInstance.clouser()
        clsInstance.counter += 1
        clsInstance.clouser()
    }
    
}


class ClassA {
    var counter = 1
    lazy var clouser: () -> Void = { [counter] in
        print(counter)
    }
}

let instanceB = ClassB()
instanceB.someMthod()







//func makeIncrementer() -> () -> Int {
//    var counter = 0
//    
//    let incrementer: () -> Int = {
//        counter += 1
//        return counter
//    }
//    
//    return incrementer
//}
//
//let incrementByOne = makeIncrementer()
//
//print(incrementByOne()) // Output: 1
//print(incrementByOne()) // Output: 2


let constantValue = 10
 
 // This closure captures both the constant `constantValue` and the parameter `factor`
 let multiplier: (Int) -> Int = { value in
     // We can modify the captured constant and use the parameter
     let result = value + constantValue
     return result
 }

print(multiplier(3))

class Person {
    var name: String
    weak var car: Car?

    init(name: String) {
        self.name = name
    }
}

class Car {
    let model: String
    var owner: Person?

    init(model: String) {
        self.model = model
    }
}

var john: Person? = Person(name: "John")
var bmw: Car? = Car(model: "BMW")

john?.car = bmw
bmw?.owner = john


var x = 10

var closure1: () -> () = {
    print("x is \(x)")
}

// Assign closure1 to closure2
var closure2 = closure1

// Modify x
x = 20

// Call both closures
closure1() // Output: x is 20
closure2() // Output: x is 20


func swapingValue() {
    var a = 5
    var b = 10
//    var temp = 0
//    temp = a
//    a = b
//    b =  temp
    a = a + b //  5 + 10 = 15
    b = a - b // 15 - 10 = 5
    a = a - b // 15 - 5 = 10
    
    print(a, b)
}

swapingValue()


var originalArray = [1, 2, 3, 4, 5]
var copiedArray = originalArray // A copy of the reference to the original array is created
copiedArray[0] = 100
print(copiedArray,originalArray) // Output: [100, 2, 3, 4, 5] (changed)


struct Point {
    var x: Int
    let y: Int
}

var point1 = Point(x: 1, y: 2)

//var point2 = point1

point1.x = 7

print(point1.x)


let optional: String? = .none

// Class Vs Struct
struct ShoppingCartItem {
    var name: String
    var price: Double
    var quantity: Int
}

class ShoppingCartItem1 {
    var name: String
    var price: Double
    var quantity: Int

    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }

    func updateQuantity(newQuantity: Int) {
        quantity = newQuantity
    }
}



//struct Point {
//    var x: Int
//    let y: Int
//}
//
//var point1 = Point(x: 1, y: 2)
//
//var point2 = point1
//
//point2.x = 7
//
//print(point1.x, point2.x)




class PersonClass {
    
    let username: String
    var age: Int
    
    init(username: String, age: Int) {
        self.username = username
        self.age = age
    }
    
    deinit {
        print("Instance of MyClass is being deallocated")
    }
}

let personObject1:PersonClass? = PersonClass(username: "Pradeep", age: 12)

let personObject2 = personObject1

personObject2!.age = 6

print(personObject1!.age, personObject2!.age)

//personObject1 = nil
//personObject2 = nil














let A: Set = [5, 2, 7, 9]
print(A.sorted())


var array = [4,3,7,5,6,2,1]

func arraySorting() {
    
    for i in 0..<array.count {
        for j in 0..<array.count - 1 - i {
            if array[j] > array[j + 1] {
                let tepArray = array[j]
                array[j] = array[j + 1]
                array[j + 1] = tepArray
            }
        }
    }
    print("sfeff", array)

}
arraySorting()
