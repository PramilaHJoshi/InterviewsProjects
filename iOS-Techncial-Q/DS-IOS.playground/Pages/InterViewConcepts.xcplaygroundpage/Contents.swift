
import Foundation

var greeting = "Hello, playground"


func testDispatch() {
    print ("1")
    DispatchQueue.global().async {
        print ("2")
        DispatchQueue.main.async {
            print ("3")
        }
        print ("4")
        DispatchQueue.main.sync {
            print ("5")
        }
        DispatchQueue.main.async {
            print ("6")
            
            DispatchQueue.main.sync {
                print("7")
            }
        }
        print ("8")
    }
    print ("9")
}

testDispatch ()
// 1,9,2,4,3, 5,8, 6
/*
 Polymorphism
 */
class Animal1 {
    func makeSound() {
        print("Some general animal sound")
    }
}
class Dog1: Animal1 {
    override func makeSound() {
        print("Bark")
    }
}
class Cat1: Animal1 {
    override func makeSound() {
        print("Meow")
    }
}
func playSound(animal: Animal1) {
    animal.makeSound()
}
let dog = Dog1()
let cat = Cat1()

playSound(animal: dog)  // Output: Bark
playSound(animal: cat)  // Output: Meow
/*
 Inheritance:
 */
class Animal {
    var animalType: Int = 0
    func makeSound() {
        print("Some sound", animalType)
    }
}
class Dog: Animal {
    override func makeSound() {
        animalType = 10
        print("Bark: ", animalType)
        
    }
}
let myDog = Dog()
myDog.makeSound()

let animalName = Animal()
animalName.makeSound()
/*
 Encapsulation: It hides the internal state of the object from the outside world and only exposes a controlled interface.
 */

class BankAccount {
    private var balance: Double
    init(initialBalance: Double) {
        self.balance = initialBalance
    }
    func deposit(amount: Double) {
        balance += amount
    }
    func withdraw(amount: Double) -> Bool {
        if balance >= amount {
            balance -= amount
            return true
        } else {
            return false
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
}
var account = BankAccount(initialBalance: 1000)
account.deposit(amount: 500)
let success = account.withdraw(amount: 200)
print("New balance: \(account.getBalance())")

//-----------------------------------OOPS-------------------------------------
/*
 Delaget pattern:
 Description: Defines a protocol to allow one object to communicate with another without tightly coupling the objects.
 */

protocol MyDelegate: AnyObject {
    func updateName(name: String)
}
class MyClass {
    weak var delegate: MyDelegate?
    
    func myFunc() {
        delegate?.updateName(name: "Pradeep")
    }
    
}
class MyDelegateImplementation: MyDelegate {
    func updateName(name: String) {
        print("Name Printed :", name)
    }
}
var myClass = MyClass()
var myImplementationClass = MyDelegateImplementation()
myClass.delegate = myImplementationClass
myClass.myFunc()

/* Observe Pattern:
 Description: Allows an object (the observer) to listen for and react to changes in another object (the subject)
 
 Benefits:
 Decoupling: Components that produce events and components that react to events are separated, promoting modular design.
 Dynamic Relationships: Observers can be added or removed at runtime, providing flexibility.
 Single Source of Truth: Ensures consistency by keeping all observers updated with the latest state.
 */
protocol WeatherObserver: AnyObject {
    func update(temperature: Float)
}
class WeatherStation {
    private var observers = [WeatherObserver]()
    private var temperature: Float = 0.0
    
    func addObserver(_ observer: WeatherObserver) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: WeatherObserver) {
        observers = observers.filter { $0 !== observer }
    }
    
    func setTemperature(_ temp: Float) {
        temperature = temp
        notifyObservers()
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.update(temperature: temperature)
        }
    }
}
class PhoneDisplay: WeatherObserver {
    func update(temperature: Float) {
        print("Phone display updated: Temperature is \(temperature)°C")
    }
}
class TVDisplay: WeatherObserver {
    func update(temperature: Float) {
        print("TV display updated: Temperature is \(temperature)°C")
    }
}

let weatherStation = WeatherStation()
let phoneDisplay = PhoneDisplay()
let tvDisplay = TVDisplay()

// Add observers to the weather station
weatherStation.addObserver(phoneDisplay)
weatherStation.addObserver(tvDisplay)

// Change the temperature
weatherStation.setTemperature(25.0)
weatherStation.setTemperature(30.5)

// Singleton

class Singleton {
   static let shared = Singleton()
   private init(){ }
}

/*
 ----------------------------------------------------Design Patterns ---------------------------------------------------
 */

func cuncurrency() {
//    let queue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)
//    queue.async { print("Task 1") }
//    queue.async { print("Task 2") }
    
    DispatchQueue.global().async {
        // Background task
        print("Fetching data...")
        DispatchQueue.main.async {
            // Update UI on the main thread
            print("UI updated")
        }
    }
}
cuncurrency()

func synchronousTaks() {
    
    
    let queue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
    var sharedResource = [String]()

    // Multiple reads can happen concurrently
    queue.async {
        print("Reading: \(sharedResource)")
    }

    queue.async {
        print("Reading: \(sharedResource)")
    }

    // A write happens with exclusive access
    queue.async(flags: .barrier) {
        sharedResource.append("New Data")
        print("Writing: \(sharedResource)")
    }

    // Further reads will only happen after the write completes
    queue.async {
        print("Reading after write: \(sharedResource)")
    }
    
    
//    DispatchQueue.global(qos: .background).async {
//        // Perform background task here
//        for i in 0..<1000 {
//            print("Background task running: \(i)")
//        }
//        
//        // If you need to update the UI after the background task:
//        DispatchQueue.main.async {
//            // Update the UI here
//            print("Background task completed")
//        }
//    }
    
    
    //let semaphore = DispatchSemaphore(value: 1)
//    let queue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
//    var sharedResource = 0
//
//    queue.async {
//        for _ in 0..<100 {
//            //semaphore.wait()
//            sharedResource += 1
//            print("Incremented by thread \(Thread.current) - sharedResource: \(sharedResource)")
//            //semaphore.signal()
//            
//        }
//    }
//
//    queue.async {
//        for _ in 0..<100 {
//            //semaphore.wait()
//            sharedResource -= 1
//            print("Decremented by thread \(Thread.current) - sharedResource: \(sharedResource)")
//            //semaphore.signal()
//        }
//    }
    
    // Adding a delay to ensure that all tasks have completed before checking the result
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//        assert(sharedResource == 0, "Race condition detected: sharedResource is \(sharedResource)")
//    }

    
    
//    let serialQueue = DispatchQueue(label: "com.example.serialQueue")
//
//    serialQueue.async {
//        print("Task 1 started")
//        Thread.sleep(forTimeInterval: 2) // Simulate some work
//        print("Task 1 finished")
//    }
//
//    serialQueue.async {
//        print("Task 2 started")
//        Thread.sleep(forTimeInterval: 2) // Simulate some work
//        print("Task 2 finished")
//    }
//
//    print("Main thread is not blocked")
//    
//    
//    print("Start")
//
//    DispatchQueue.global().sync {
//        print("Task started")
//        Thread.sleep(forTimeInterval: 2) // Simulate some work
//        print("Task finished")
//    }
//
//    print("End")
    
    
//    let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
//
//    concurrentQueue.async {
//        print("Task 1 started")
//        Thread.sleep(forTimeInterval: 2) // Simulate work
//        print("Task 1 finished")
//    }
//
//    concurrentQueue.async {
//        print("Task 2 started")
//        Thread.sleep(forTimeInterval: 2) // Simulate work
//        print("Task 2 finished")
   // }
    
//    let serialQueue = DispatchQueue(label: "com.example.serialQueue")
//
//    serialQueue.async {
//        print("Task 1 started")
//        Thread.sleep(forTimeInterval: 2) // Simulate work
//        print("Task 1 finished")
//    }
//
//    serialQueue.async {
//        print("Task 2 started")
//        Thread.sleep(forTimeInterval: 2) // Simulate work
//        print("Task 2 finished")
//    }
    
    
//    DispatchQueue.global().async {
//        // Asynchronous task
//        print("Task 1 running asynchronously")
//    }
//
//    print("Task 2 will run immediately, without waiting for Task 1")
    
//    DispatchQueue.global().sync {
//        // Synchronous task
//        print("Task 1 running synchronously")
//    }
//    
//    print("Task 2 will run after Task 1")
}

synchronousTaks()

class Customer {
    var name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
class CreditCard {
    var number: String
    unowned var customer: Customer
    init(number: String, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("CreditCard \(number) is being deinitialized")
    }
}

var john1: Customer? = Customer(name: "John")
john1?.card = CreditCard(number: "1234 5678 9876 5432", customer: john1!)
john1 = nil

protocol SomeDelegate: AnyObject {
    func didSomething()
}

class SomeClass {
    weak var delegate: SomeDelegate?
    
    func doSomething() {
        delegate?.didSomething()
    }
}

class AnotherClass: SomeDelegate {
    func didSomething() {
        print("Did something!")
    }
}

var instance: SomeClass? = SomeClass()
var anotherInstance: AnotherClass? = AnotherClass()

//instance?.delegate = anotherInstance
//instance?.doSomething()  // Output: "Did something!"

anotherInstance = nil
instance?.doSomething()  // No output, delegate is nil


//----------------------------------------------------------------------------------------------------------------------------

//class Person1 {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class House {
//    // Unowned reference to a Person
//    unowned var owner: Person1
//    
//    init(owner: Person1) {
//        self.owner = owner
//    }
//}
//
//// Create a Person instance
//var person: Person1? = Person1(name: "John Doe")
//
//// Create a House instance with a strong reference to Person
//var house: House? = House(owner: person!)
//
//// Access the owner's name through the house
//print("Owner's name: \(house!.owner.name)") // Prints: Owner's name: John Doe
//
//// Deallocate the Person instance
//person = nil
//
//// Access the owner's name through the house again
//// This will crash because the owner (Person) has been deallocated
//print("Owner's name: \(house!.owner.name)")


class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}


class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person? = Person(name: "John Appleseed")
print("Reference count after creation: \(CFGetRetainCount(john))")
var unit4A: Apartment? = Apartment(unit: "4A")
print("Reference count after creation: \(CFGetRetainCount(unit4A))")


john!.apartment = unit4A
print("Reference count after creation: \(CFGetRetainCount(john))")
unit4A!.tenant = john
print("Reference count after creation: \(CFGetRetainCount(john))")






protocol ProtocolDelegate: AnyObject {
    func didRecieveItem(item: String)
}

class Person1 {
    weak var delegate: ProtocolDelegate?
    func sendData() {
        delegate?.didRecieveItem(item: "Send data to Class B")
    }
    
    deinit {
        print("Person 1 Deinit Call")
    }
}

class Person2: ProtocolDelegate {
    func didRecieveItem(item: String) {
        print(item)
    }
    deinit {
        print("Person 2 Deinit Call")
    }
}

func runExample() {
    let person1Object = Person1()
    let person2Object = Person2()
    
    person1Object.delegate = person2Object
    person1Object.sendData()
}
runExample()

//var person1Object: Person1? = Person1()
//var person2Object: Person2? =  Person2()
//person1Object?.delegate = person2Object
//person1Object?.sendData()
//
//person1Object = nil
//person2Object = nil

protocol LoginViewModelProtocol {
    
    func someFunctionWithNonEscapingClouser(completionHandler: @escaping (String) -> Void)
}

class LoginViewModel: LoginViewModelProtocol {
    
    var complitionHandler: [(String) -> Void] = []
    func someFunctionWithNonEscapingClouser(completionHandler: @escaping (String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.complitionHandler.append(completionHandler)
            defer {
                //print("--Print - 1")
                completionHandler("Completion with String after 3 seconds")
            }
            print("---- Print - 2")
        }
    }
}
let loginVM = LoginViewModel()
loginVM.someFunctionWithNonEscapingClouser { result in
    defer {
        print("--Print - 1234")
    }
    print("--Print - 1344", result)
}



//class Login {
//    
//    var loginVM: LoginViewModelProtocol?
//    init(loginVM: LoginViewModelProtocol? = nil) {
//        self.loginVM = loginVM
//    }
//    
//    //var loginVM: LoginViewModel = LoginViewModel()
//    
//    func getRequest() {
//        loginVM?.someFunctionWithNonEscapingClouser { _ in [weak self] in
//            print("escaping function return")
//            self?.handleCompletion() // Example of using self in a safe manner
//        }
//    }
//    
//    private func handleCompletion() {
//            print("Completion handler executed")
//        }
//}
//
//
//let login = Login(loginVM: LoginViewModelProtocol)
//
//func makeIncreamenter(forIncrement amount: Int) -> () -> Int {
//    var runningTotal = 0
//    print("Befor Clouser Call", runningTotal)
//    let increamenter: () -> Int = {
//        print("amount: ", amount)
//        runningTotal += amount
//        print("After Clouser Call", runningTotal)
//        return runningTotal
//    }
//    return increamenter
//}

//let incrementByTen = makeIncreamenter(forIncrement: 10)
//incrementByTen()
//incrementByTen()



//ThightlyCoupled Code
class Address {
    var street: String
    init(street: String) {
        self.street = street
    }
}
class User {
    var address: Address?
}
class UserManager {
    func getUserStreet(user: User) -> String? {
        return user.address?.street  // Tight coupling to User's structure
    }
}
//------------------------------------------------------------------------------------------
protocol AddressProvider {
    func getStreet() -> String?
}

class Address1 {
    var street: String
    init(street: String) {
        self.street = street
    }
}

class User1: AddressProvider {
    var address: Address1?
    
    func getStreet() -> String? {
        return address?.street
    }
}

class UserManager1 {
    func getUserStreet(user: AddressProvider) -> String? {
        return user.getStreet()
    }
}
//Dependancy Inverse Principle(DIP)
class DatabaseService: DataStorage {
    func save(user: String) {
        // Code to save the user data to a database
        print("User saved to database")
    }
}

class UserManager2 {
    private let dataStorage: DataStorage
    init(_dataStorage: DataStorage) {
        self.dataStorage = _dataStorage
    }
    
    func saveUser(user: String) {
        dataStorage.save(user: user)
    }
}

protocol DataStorage {
    func save(user: String)
}

/*
 Dependency Injection (DI) is a design pattern that allows a class to receive its dependencies from external sources rather than creating them internally. This promotes loose coupling, enhances testability, and improves code maintainability. In Swift, two common forms of dependency injection are Constructor Injection and Property Injection
 
 Best Practices:
 Use constructor injection when the dependency is required for the object to function correctly, as it ensures the dependency is set at initialization and can't be changed.
 Use property injection when the dependency might not be required immediately or can change during the object's lifecycle, but be cautious about managing the object's state.
 */
// Define a protocol for the network service
protocol NetworkServiceProtocol {
    func fetchData(from url: URL, completion: @escaping (Data?) -> Void)
}

// Concrete implementation of the network service
class NetworkService: NetworkServiceProtocol {
    func fetchData(from url: URL, completion: @escaping (Data?) -> Void) {
        // Real network fetch
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            completion(data)
        }
        task.resume()
    }
}

// Mock network service for testing
class MockNetworkService: NetworkServiceProtocol {
    var mockData: Data?

    func fetchData(from url: URL, completion: @escaping (Data?) -> Void) {
        // Return mock data immediately
        completion(mockData)
    }
}

// ViewController that depends on NetworkServiceProtocol
class ViewController {
    private let networkService: NetworkServiceProtocol

    // Constructor Injection
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func loadData(completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: "https://api.example.com/data") else {
            completion(nil)
            return
        }
        networkService.fetchData(from: url) { data in
            completion(data)
        }
    }
}

// Unit Test Example
func testViewControllerLoadData() {
    // Arrange
    let mockService = MockNetworkService()
    let expectedData = "Test data".data(using: .utf8)
    mockService.mockData = expectedData
    let viewController = ViewController(networkService: mockService)

    // Act
    viewController.loadData { data in
        // Assert
        assert(data == expectedData, "Expected data does not match received data.")
        print("Test passed: Data matches expected mock data.")
    }
}

// Run the test
testViewControllerLoadData()

protocol Services {
    func performMyAction()
}
class MyServices: Services {
    func performMyAction() {
        print("Performing action in MyService")
    }
}
class MyViewController {
    var service: Services?
    
    init(_service: Services) {
        service = _service
    }
    
    func executeAction() {
        service?.performMyAction()
    }
}

var myVC = MyViewController(_service: MyServices())
myVC.executeAction()



//Nested Fucntiion
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

//Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

//Function Types
//For example:
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
/*The type of both of these functions is (Int, Int) -> Int. This can be read as:
“A function that has two parameters, both of type Int, and that returns a value of type Int.”
Here’s another example, for a function with no parameters or return value:*/

func printHelloWorld() {
    print("hello, world")
}
//The type of this function is () -> Void, or “a function that has no parameters, and returns Void.”


//in-out Parameter
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"

//Property Wrappers
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}


var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"
rectangle.height = 10
print(rectangle.height)
// Prints "10"
rectangle.height = 24
print(rectangle.height)
// Prints "12"


//Property Observers
/*
 You have the option to define either or both of these observers on a property:
 willSet is called just before the value is stored.
 didSet is called immediately after the new value is stored.
 */
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

// defer keyword
/*
 Challenges Before defer
 Error-Prone: Ensuring that cleanup code is always executed correctly without missing any paths was difficult.
 Repetitive Code: You might end up duplicating cleanup logic in multiple places, making the code harder to maintain.
 Less Readable: Managing resource cleanup and errors in a non-centralized manner could make the code harder to understand and follow.
 
 Introduction of defer
 The introduction of defer in Swift simplified these issues by:

 Centralizing Cleanup: Keeping cleanup logic close to the resource allocation and ensuring it runs no matter how the scope is exited.
 Improving Readability: Making code more readable and maintainable by reducing duplication and ensuring that cleanup code is only written once.
 Ensuring Execution: Guaranteeing that certain actions, such as closing files or releasing locks, are always executed, even if errors occur or if the function exits early.
 defer provided a cleaner, more reliable, and easier-to-maintain solution for managing resources and cleanup tasks in Swift.
 
 ------------------------------------------------------
 
 Automatic Cleanup: defer helps in managing resources and performing cleanup tasks automatically. It ensures that resource-intensive tasks like closing files, releasing locks, or deallocating memory are handled properly, even if an error occurs or an early exit happens. This is particularly useful in managing resources manually, which is a common scenario in lower-level programming.

 Readability and Maintainability: By using defer, you can keep the code that deals with setup and teardown close to each other. This improves the readability and maintainability of the code because you don’t have to scatter cleanup code across different parts of the function or code block.

 Error Handling: In Swift, error handling often involves multiple exit points in a function (such as early returns or throwing errors). defer simplifies the cleanup process by ensuring that necessary finalization happens regardless of which exit point is hit.

 Ensuring Execution: defer guarantees that the code inside it runs even if an error is thrown or a return statement is executed. This guarantees the integrity of resource management and error handling, as the cleanup code will always be executed in a predictable manner.

 Scoped Execution: The defer blocks are executed in LIFO (Last In, First Out) order, which ensures that the last resource that was acquired is the first to be released. This can be particularly useful for managing complex resources that need to be cleaned up in a specific order.
 */
//Before introduce defer keyword
func readFile(at path: String) {
    var fileHandle: FileHandle?
    do {
        fileHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: path))
        // Perform file operations
        // Handle file operations error
    } catch {
        fileHandle?.closeFile()
        print("Error: \(error)")
    }
}
func readFileAfterDefer(at path: String) {
    let fileHandle: FileHandle
    do {
        fileHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: path))
        defer {
            fileHandle.closeFile()
            print("File closed")
        }
        // Perform file operations
        let data = fileHandle.readDataToEndOfFile()
        print("Data: \(data)")
    } catch {
        print("Error: \(error)")
        // Cleanup handled by defer
    }
}
/*Benefits:

Automatic Cleanup: defer ensures that the file is always closed regardless of success or failure.
Readability: Keeps resource management code close to where the resource is used.*/

func criticalSection() {
    let lock = NSLock()
    lock.lock()
    do {
        // Critical section
    } catch {
        // Handle error
    }
    
    lock.unlock()
}

func criticalSection1() {
    let lock = NSLock()
    lock.lock()
    
    defer {
        lock.unlock()
        print("Lock released")
    }
    // Critical section
}
