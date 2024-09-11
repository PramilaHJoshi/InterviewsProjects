import Foundation

var greeting = "Hello, playground"

// Clouser Question

class MyClass {
    var value = 0
    func doSomething() {
        let closure = { [weak self] in
            guard let self = self else { return }
            self.value += 1
            print(self.value)
        }
        closure()
    }
}

let instance = MyClass()
instance.doSomething()  // Output: 1

//2. How does capturing work with inout parameters in closures?
func modifyValue(_ value: inout Int) -> () -> Void {
    return {
        value += 1  // Error: Cannot capture `inout` parameter `value`
    }
}

// Correct approach:
func modifyValueSafely(_ value: inout Int) -> () -> Void {
    let currentValue = value  // Capture the current value in a local variable
    return {
        print(currentValue + 1)  // Use the captured value
    }
}

//escaping clouser

//The Limitation Without @escaping:
//Without the ability for closures to escape, it was challenging to work with asynchronous code or store closures for later execution. Many common programming patterns (like callbacks for network requests or handling UI events asynchronously) could not be implemented effectively.
 
//Introduction of @escaping:
// To address these limitations, Swift introduced the @escaping keyword. This allowed closures to outlive the function they were passed into, enabling more complex and flexible programming patterns while still providing safety mechanisms (like requiring explicit capture of self) to prevent memory management issues.

//With @escaping, you could now:
//Store closures in properties or arrays to be executed later. Use closures as callbacks in asynchronous operations, where the closure would only be executed after the function returned.

//Escaping Closures

//A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.

//One way that a closure can escape is by being stored in a variable that’s defined outside the function. As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn’t called until the operation is completed — the closure needs to escape, to be called later. For example:

//Examples:

class SomeClass {
    var x = 10

    func someFunctionWithEscapingClosure(completion: @escaping () -> Void) {
        // Simulate storing the closure for later use
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            completion()
        }
    }

    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
            print("Value of x is \(self.x)")
        }
    }

    deinit {
        print("SomeClass is being deinitialized")
    }
}

func createMemoryLeak() {
    let instance = SomeClass()
    instance.doSomething()
}

createMemoryLeak()

///@esacping
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

///@non-esacping
///
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"
completionHandlers.first?()
print(instance.x)
// Prints "100"


//Examples:

// A service class to manage network requests
class DataFetcher1 {
    // The completion handler closure will be stored and called later when the data is fetched
    var completionHandler: ((String) -> Void)?

    // Function with an escaping closure
    func fetchData(completion: @escaping (String) -> Void) {
        // Store the completion handler to call later
        self.completionHandler = completion
//        // Simulate an asynchronous network operation using a dispatch queue
        DispatchQueue.global().async {
            // Simulating a delay for the network request
            sleep(2) // Represents network latency
            // Once data is "fetched," we call the completion handler
            let fetchedData = "Fetched data from server"
            // Call the completion handler on the main thread
            DispatchQueue.main.async {
                self.completionHandler?(fetchedData)
            }
        }
    }
    // Function with a non-escaping closure
    func processImmediately(closure: (String) -> Void) {
        let immediateData = "Immediate data processing"
        // This closure is executed immediately
        closure(immediateData)
    }
}

class ViewController {
    let dataFetcher = DataFetcher1()
    func performOperations() {
        // Non-escaping closure example
        dataFetcher.processImmediately { data in
            print("Non-escaping closure: \(data)")
        }
        // Escaping closure example
        dataFetcher.fetchData { [weak self] data in
            // This code will run after the data is fetched, possibly much later
            print("Escaping closure: \(data)")
            self?.updateUI(with: data)
        }
        print("Started fetching data...")
    }
    
    func updateUI(with data: String) {
        print("Updating UI with: \(data)")
    }
}

//Example of a Strong Reference Cycle
class SomeClass1 {
    var someProperty: String = "Hello"
    var closure: (() -> Void)?
    
    func configureClosure() {
        closure = {
            print(self.someProperty)
        }
    }
}

// Breaking Strong Reference Cycles with Capture Lists Swift provides a way to break this strong reference cycle using capture lists. A capture list allows you to define how self (or any other captured variables) should be captured—typically by using a weak or unowned reference
class SomeClass2 {
    var someProperty: String = "Hello"
    var closure: (() -> Void)?
    
    func configureClosure() {
        closure = { [weak self] in
            guard let self = self else { return }
            print(self.someProperty)
        }
    }
}

let instance = SomeClass2()
instance.configureClosure()

//Clousers
/*Closures are self-contained blocks of functionality that can be passed around and used in your code.
Closures can capture and store references to any constants and variables from the context in which they’re defined. This is known as closing over those constants and variables. Swift handles all of the memory management of capturing for you.*/

// EXAMPLES
///Example Comparison

///With @escaping Closures:
func fetchData(completion: @escaping (String) -> Void) {
    // Simulating async operation
    DispatchQueue.global().async {
        let data = "Fetched Data"
        DispatchQueue.main.async {
            completion(data)
        }
    }
}

fetchData { data in
    print(data)
}
///Before @escapiong Closures:
protocol DataFetcherDelegate: AnyObject {
    func didFetchData(data: String)
}
class DataFetcher {
    weak var delegate: DataFetcherDelegate?
    
    func fetchData() {
        // Simulating async operation
        DispatchQueue.global().async {
            let data = "Fetched Data"
            DispatchQueue.main.async {
                self.delegate?.didFetchData(data: data)
            }
        }
    }
}
class ViewController: DataFetcherDelegate {
    func didFetchData(data: String) {
        print(data)
    }
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

func makeIncrementer1(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    // This is the closure that captures the 'total' variable
    let incrementer: () -> Int = {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTwo = makeIncrementer(incrementAmount: 2)
print(incrementByTwo())  // Output: 2
print(incrementByTwo())  // Output: 4
print(incrementByTwo())  // Output: 6

//let dataFetcher = DataFetcher()
//let viewController = ViewController()
//dataFetcher.delegate = viewController
//dataFetcher.fetchData()


//Autoclosures
