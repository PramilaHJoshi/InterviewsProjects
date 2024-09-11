//
//  ViewController.swift
//  InterViewPreperation
//
//  Created by Pradeep Kumar Yeligandla on 15/08/24.
//

import UIKit

struct PersonStruct {
    var name: String
    var age: Int
}

class Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Singleton {
    static var shared = Singleton()
    private init() {} // Prevents initialization from outside
}

func lengthOfLongestSubstring(_ s: String) -> Int {
    var charIndexDict = [Character: Int]()
    var start = 0
    var maxLength = 0
    
    for (index, char) in s.enumerated() {
        if let lastSeenIndex = charIndexDict[char], lastSeenIndex >= start {
            start = lastSeenIndex + 1
        }
        // Update the maxLength after calculating the new start
        let currentLength = index - start + 1
        if currentLength > maxLength {
            maxLength = currentLength
        }
        charIndexDict[char] = index
    }
    return maxLength
}
class BankAccount {
    var balance: Int = 0
    
    func deposit(amount: Int) {
        let currentBalance = balance
        sleep(1) // Simulate delay
        balance = currentBalance + amount
    }
    
    func withdraw(amount: Int) {
        let currentBalance = balance
        sleep(1) // Simulate delay
        balance = currentBalance - amount
    }
    func getBalance() -> Int {
           return balance
       }
}

// Asynchronous function definition
func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}



// Example of an asynchronous operation
func performAsyncOperation() async -> String {
    // Simulate some asynchronous work
    try? await Task.sleep(nanoseconds: 1_000_000_000) // Sleep for 1 second
    return "Operation Completed"
}

// Function that uses TaskGroup
func performConcurrentTasks() async {
    await withTaskGroup(of: String.self) { group in
        // Add tasks to the group
        group.addTask {
            try? await Task.sleep(nanoseconds: 1_000_000_000) // Sleep for 1 second
            return "Task 1 Completed"
        }
        
        group.addTask {
            try? await Task.sleep(nanoseconds: 2_000_000_000) // Sleep for 2 seconds
            return "Task 2 Completed"
        }
        
        // Process results as they complete
        for await result in group {
            print("Received result: \(result)")
        }
    }
}

func semaphoreExample() {
    // Step 1: Declare workItem as a lazy variable
    lazy var workItem: DispatchWorkItem = DispatchWorkItem {
        // Step 2: Check if the work item has been canceled
        for i in 1...5 {
            if workItem.isCancelled { // workItem is now safely referenced
                print("Task was canceled at iteration \(i)")
                return // Exit early if canceled
            }
            print("Task \(i) is executing")
            sleep(1) // Simulate some work
        }
        print("Task completed successfully")
    }

    
    DispatchQueue.global().async(execute: workItem)

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        workItem.cancel() // Cancel the work item after 2 seconds
    }
//    let semaphore = DispatchSemaphore(value: 2) // Allows 2 concurrent accesses
//
//    let queue = DispatchQueue.global()
//
//    for i in 1...5 {
//        queue.async {
//            semaphore.wait()
//            print("Task \(i) started")
//            sleep(2) // Simulate some work
//            print("Task \(i) finished")
//            semaphore.signal()
//        }
//    }
}

protocol FullyNamed {
    var fullName: String { get }
}
class Starship: FullyNamed {
    var prefi34x: String?
    var name: String
    init(name: String, prefi34x: String? = nil) {
        self.name = name
        self.prefi34x = prefi34x
    }
    var fullName: String {
        return (prefi34x != nil ? prefi34x! + " " : "") + name
    }
}

class ViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var ncc1701 = Starship(name: "Enterprise", prefi34x: "USS")
        
        semaphoreExample()
//        Task {
//            let result = await performAsyncOperation()
//            print("Result: \(result)")
//        }
//        
//        
//        // Call the function
//        Task {
//            await performConcurrentTasks()
//        }
        
        // Calling the asynchronous function
        // Calling the asynchronous function
//        Task {
//            let photos = try await listPhotos(inGallery: "A Rainy Weekend")
//            print("Fetched photo names: \(photos)")
//        }

        
        
//        let account = BankAccount()
//
//        // Simulating concurrent access
//        DispatchQueue.global().async {
//            account.deposit(amount: 100)
//        }
//
//        DispatchQueue.global().async {
//            account.withdraw(amount: 50)
//        }
//        
//        print("Current Balance: ", account.getBalance())
//        
    
//        let maxLength = lengthOfLongestSubstring("abcabcbb")
//        print(maxLength)
        
        
       // let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
       // print("min is \(bounds.min) and max is \(bounds.max)")
       // let sum = findPair(array: [8, -6, 2, 109, 3, 71], x: 5)
       // print(sum)
        
//        let input: [Any] = [3, 4, [2, 1], [5], [6], 7]
//        let output = flatten(array: input)
//        print(output)
        
//        var originalArrayInt: [Int] = [1, 2, 3, 4, 5, 6]
//        reverseArray(&originalArrayInt)

        //var originalArrayString: [Character] = ["h", "e", "l", "l", "o"]
        //reverseArray(&originalArrayString)
        
    }
    
//    func reverseArray<T>(_ array: inout [T]) {
//        let count = array.count
//        for i in 0..<count {
//            for j in <#items#> {
//                <#code#>
//            }
//            //(array[i], array[count - 1 - i]) = (array[count - 1 - i], array[i])
//        }
//        
//        print(array)
//    }
    
    func flatten(array:[Any]) -> [Int] {
        var resultArray: [Int] = []
        for elements in array {
            if let subaArray = elements as? [Any] {
                resultArray.append(contentsOf: flatten(array: subaArray))
            } else if let num = elements as? Int {
                resultArray.append(num)
            }
        }
       return resultArray
    }
    
    func findPair(array: [Int], x: Int) -> [Int] {
      
        var seenNumbers = [Int]()
        
        for number in array {
            let complement = x - number
            if seenNumbers.contains(complement) {
                return [complement, number]
            }
            seenNumbers.append(number)
        }
        
        return []
        
//        var seenNumbers = [Int: Bool]()
//          
//          for number in array {
//              let complement = x - number
//              if seenNumbers[complement] != nil {
//                  return [complement, number]
//              }
//              seenNumbers[number] = true
//          }
//          
//          return []
    }
    func twoSums(array: [Int], x: Int) -> [Int] {
        for index in 0..<array.count {
            for j in 1..<array.count {
                if array[index] + array[j] == x {
                    return [array[index], array[j]]
                }
            }
        }
        return []
    }
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }


}


//class Parent {
//    // Constant stored property
//    let constantProperty: Int = 42
//}
//
//class Child: Parent {
//   // Attempting to add property observers to a computed property
//        override var computedProperty: Int {
//            didSet {
//                print("computedProperty did set")
//            }
//        }
//}


class Vehicle {
   final var currentSpeed = 0.0
   final var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
   final func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
class Bicycle: Vehicle {
    var hasBasket = false

    func normalMethod() {
        print(super.currentSpeed)
    }
}
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

class Car: Vehicle {
    var gear = 1
//    override var description: String {
//        return super.description + " in gear \(gear)"
    //}
}
