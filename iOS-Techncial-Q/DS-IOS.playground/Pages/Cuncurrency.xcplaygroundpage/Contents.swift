//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

Task {
    let result = await performAsyncOperation()
    print("Result: \(result)")
}

func performAsyncOperation() async -> String {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    return "Operation Completed"
}


func performAsyncOperation(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        // Simulate asynchronous work
        Thread.sleep(forTimeInterval: 1.0)
        DispatchQueue.main.async {
            completion("Operation Completed")
        }
    }
}

performAsyncOperation { result in
    print("Result: \(result)")
}

// Multiple Operation:

func fetachMultipleData() async {
    await withTaskGroup(of: String.self) { group in
        group.addTask {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            return "Task 1"
        }
        group.addTask {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            return "Task 2"
        }
        for await result in group {
            print("Received result: \(result)")
        }
    }
}



// Without async/await
func fetchData(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        // Simulate some asynchronous work
        Thread.sleep(forTimeInterval: 1.0) // Sleep for 1 second
        DispatchQueue.main.async {
            completion("Data fetched")
        }
    }
}

fetchData { result in
    print("Result: \(result)")
}
//Multiple Concurrent Operations
func fetchData1(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        // Simulate async work
        Thread.sleep(forTimeInterval: 1.0) // Sleep for 1 second
        DispatchQueue.main.async {
            completion("Data 1 fetched")
        }
    }
}

func fetchData2(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        // Simulate async work
        Thread.sleep(forTimeInterval: 2.0) // Sleep for 2 seconds
        DispatchQueue.main.async {
            completion("Data 2 fetched")
        }
    }
}

fetchData1 { result1 in
    print("Result 1: \(result1)")
    fetchData2 { result2 in
        print("Result 2: \(result2)")
    }
}

//2. Using Delegates

protocol DataFetcherDelegate: AnyObject {
    func didFetchData(result: String)
}

class DataFetcher {
    weak var delegate: DataFetcherDelegate?

    func fetchData() {
        DispatchQueue.global().async {
            // Simulate some asynchronous work
            Thread.sleep(forTimeInterval: 1.0) // Sleep for 1 second
            DispatchQueue.main.async {
                self.delegate?.didFetchData(result: "Data fetched")
            }
        }
    }
}
class ViewController: DataFetcherDelegate {
    func didFetchData(result: String) {
        print("Result: \(result)")
    }

    func startFetching() {
        let fetcher = DataFetcher()
        fetcher.delegate = self
        fetcher.fetchData()
    }
}
//Using Operation Queues

func fetchData() {
    let operationQueue = OperationQueue()
    operationQueue.addOperation {
        // Simulate some asynchronous work
        Thread.sleep(forTimeInterval: 1.0) // Sleep for 1 second
        OperationQueue.main.addOperation {
            print("Data fetched")
        }
    }
}

fetchData()


func fetchData1(completion: @escaping (String) -> Void) {
    let operationQueue = OperationQueue()
    operationQueue.addOperation {
        // Simulate async work
        Thread.sleep(forTimeInterval: 1.0) // Sleep for 1 second
        OperationQueue.main.addOperation {
            completion("Data 1 fetched")
        }
    }
}

func fetchData2(completion: @escaping (String) -> Void) {
    let operationQueue = OperationQueue()
    operationQueue.addOperation {
        // Simulate async work
        Thread.sleep(forTimeInterval: 2.0) // Sleep for 2 seconds
        OperationQueue.main.addOperation {
            completion("Data 2 fetched")
        }
    }
}

fetchData1 { result1 in
    print("Result 1: \(result1)")
    fetchData2 { result2 in
        print("Result 2: \(result2)")
    }
}
