import UIKit

var greeting = "Hello, playground"


var array = [1, 0, 1, 0, 1, 0]
var resultArray: [Int] = []

for element in array {
    if element == 1 {
        resultArray.insert(element, at: 0)  // Insert 1 at the beginning
    } else {
        resultArray.append(element)        // Append 0 at the end
    }
}

print(resultArray)


//var array = [1, 0, 1, 0, 1, 0]
//
//array = array.sorted { $0 > $1 }
//
//print(array)

func reverseLetters1(inputString: String) -> String {
    var characters = Array(inputString)
    var stack = [Character]()

    for char in characters {
        if char.isLetter {
            stack.append(char)
        }
    }
    
    print(stack)
    

    for i in 0..<characters.count {
        if characters[i].isLetter {
            print("******",characters[i])
            characters[i] = stack.removeLast()
            print("######",characters[i])
        } else {
            print("------",characters[i])
        }
    }

    return String(characters)
}

let inputString1 = "a1bc2f"
let reversedString1 = reverseLetters1(inputString: inputString1)
print(reversedString1)


func reverseLetters(inputString: String) -> String {
    var letters = inputString.filter { $0.isLetter }
    var reversedLetters = String(letters.reversed())
    print(reversedLetters)
    var result = ""

    for char in inputString {
        if char.isLetter {
            result.append(reversedLetters.removeFirst())
        } else {
            result.append(char)
        }
    }

    return result
}

let inputString = "a1bc2f"
let reversedString = reverseLetters(inputString: inputString)
print(reversedString)

func reverseString(_ s: String) -> String {
    var str = ""
    for character in s {
        str.append("\(character)" + str)
    }
    return str
}
let str = "abcf"
print(reverseString(str))


var myArray = [2,5,6,7,1,8,9]

//print(myArray.sorted(by: <))
// Bubble sort
// Reverse elements from array
func reverseArray<T>(_ array: inout [T]) {
    let count = array.count
    for i in 0..<count/2 {
        (array[i], array[count - 1 - i]) = (array[count - 1 - i], array[i])
    }
    
    print(array)
}
func differenceElements() -> Int {
    for i in 0..<myArray.count {
        for j in 0..<myArray.count - 1 - i {
            if myArray[j] > myArray[j + 1] {
                // Swap elements
                //(myArray[j], myArray[j + 1]) = (myArray[j + 1], myArray[j])
                let temp = myArray[j]
                myArray[j] = myArray[j + 1]
                myArray[j + 1] = temp
            }
        }
    }
    print(myArray)
    return myArray[myArray.count - 2] - myArray[1]
    
}
print(differenceElements())

// Difference between last and fist element
let integerArray: [Int] = [2,5,6,7,1,8]


let mixedArray: [Any] = ["1", "one", "2", "two", "3", "three"]

var numericArray: [Int] = []

for element in mixedArray {
    if let str = element as? String, let number = Int(str) {
        numericArray.append(number)
    }
}

print(numericArray)
let uni = mixedArray.compactMap { element in
    return Int(element as? String ?? "")
}

//let numericArray = mixedArray.compactMap { element in
//    return Int(element as? String ?? "")
//}
//
//print(numericArray)




var value = 0
func deferKey() -> Int {
    defer {
        value = value + 1
    }
    return value
}

print(deferKey())
print(value)

//func isPalindrome(_ number: Int) -> Bool {
//    let numberString = String(number)
//    return numberString == String(numberString.reversed())
//}

//MARK: - Palindrome
func isPalindrome(_ number: Int) -> Bool {
    if number < 0 {
        return false  // Negative numbers are not palindromes
    }
    var originalNumber = number
    var reversedNumber = 0
    while originalNumber > 0 {
        let digit = originalNumber % 10
        reversedNumber = reversedNumber * 10 + digit
        originalNumber /= 10
    }
    return number == reversedNumber
}

// Example usage:
let palindromeCheck1 = isPalindrome(121)  // true
let palindromeCheck2 = isPalindrome(12345) // false

print(palindromeCheck1, palindromeCheck2)


func mergeIntervals(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else {
        return intervals
    }

    var result: [[Int]] = []
    var currentInterval = intervals[0]

    for interval in intervals.dropFirst() {
        if interval[0] <= currentInterval[1] {
            // Merge overlapping intervals
            currentInterval[1] = max(currentInterval[1], interval[1])
        } else {
            // Add non-overlapping interval to the result
            result.append(currentInterval)
            currentInterval = interval
        }
    }

    // Add the last interval to the result
    result.append(currentInterval)

    return result
}
// Example usage:
let inputIntervals = [[1,3], [2,6], [8,10], [15,18]]
let mergedIntervals = mergeIntervals(inputIntervals)
print(mergedIntervals)

protocol Addable {
    static func *(lhs: Self, rhs: Self) -> Self
}

extension Int: Addable {}
extension Double: Addable {}
//extension String: Addable {}

func add<T: Addable>(_ a: T, _ b: T) -> T {
    return a * b
}

// Example usage for addition with integers
let sumInt = add(5, 3)
print("Sum (Int): \(sumInt)")

// Example usage for addition with doubles
let sumDouble = add(3.14, 2.71)
print("Sum (Double): \(sumDouble)")

// Example usage for concatenation with strings
//let concatStr = add("Hello", " World")
//print("Concatenation (String): \(concatStr)")




protocol Performable {
    static func performOperation(_ a: Self, _ b: Self) -> Self
}

extension Int: Performable {
    static func performOperation(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

extension Double: Performable {
    static func performOperation(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

extension String: Performable {
    static func performOperation(_ a: String, _ b: String) -> String {
        return a + b
    }
}

func performOperation<T: Performable>(_ a: T, _ b: T) -> T {
    return T.performOperation(a, b)
}

//// Example usage for addition with integers
//let sumInt = performOperation(5, 3)
//print("Sum (Int): \(sumInt)")
//
//// Example usage for addition with doubles
//let sumDouble = performOperation(3.14, 2.71)
//print("Sum (Double): \(sumDouble)")
//
//// Example usage for concatenation with strings
//let concatStr = performOperation("Hello", " World")
//print("Concatenation (String): \(concatStr)")




//Generis
func performOperation<T>(_ a: T, _ b: T, operation: (T, T) -> T) -> T {
    return operation(a, b)
}

// Example usage for addition with integers
let sumInt1 = performOperation(5, 3) { $0 + $1 }
print("Sum1 (Int): \(sumInt1)")

// Example usage for concatenation with strings
let concatStr1 = performOperation("Hello", " World") { $0 + $1 }
print("Concatenation1 (String): \(concatStr1)")


// Count Duplicates
func duplicateCount(_ array: [String]) {
    var counts: [String: Int] = [:]
    for item in array {
        counts[item, default: 0] += 1
    }
    print(counts)
}
let arrayWithDuplicates1 = ["apple", "banana", "orange", "apple", "kiwi", "banana"]
duplicateCount(arrayWithDuplicates1)
// Remove duplicates

let arrayWithDuplicates = [1, 2, 3, 1, 2, 4, 5]

func removeDuplicates(_ duplicateArray: [Int])  {
    var uniqueArray = [Int]()
    for item in duplicateArray {
        if !uniqueArray.contains(item) {
            uniqueArray.append(item)
        }
    }
    print(uniqueArray)
    
    //Without any predefined functions
    for element in duplicateArray {
        var isDuplicate = false
        for unique in uniqueArray {
            if element == unique {
                isDuplicate = true
                break
            }
        }
        if !isDuplicate {
            uniqueArray.append(element)
        }
        print(uniqueArray)
    }
}

removeDuplicates(arrayWithDuplicates)

let uniqueArray =  Array(Set(arrayWithDuplicates))

print(uniqueArray)

// Swaping 2 numbers with out using 3rd variables
func swaping(_ a: inout Int, _ b: inout Int) {
    
    // Method: 1
    a = a + b // a = 10, b = 20 // a = 30
    b = a - b // b = 30 - 20 = 10
    a = a - b
    print(a, b)
    
    //Method: 2, Using Tuples
    (a, b) = (b, a)
    print(a, b)
}

var a = 10
var b = 20
swaping(&a, &b)


//// Reverse elements from array
//func reverseArray<T>(_ array: inout [T]) {
//    let count = array.count
//    for i in 0..<count/2 {
//        (array[i], array[count - 1 - i]) = (array[count - 1 - i], array[i])
//    }
//
//    print(array)
//}

var originalArrayInt: [Int] = [1, 2, 3, 4, 5, 6]
reverseArray(&originalArrayInt)

var originalArrayString: [Character] = ["h", "e", "l", "l", "o"]
reverseArray(&originalArrayString)

func exampleFunction() {
    print("Start of the function")

    defer {
        print("Deferred code block 1")
    }

    // Other code in the function

    defer {
        print("Deferred code block 2")
    }

    // More code in the function

    defer {
        print("Deferred code block 3")
    }

    print("End of the function")
}
// Call the function
exampleFunction()





//
//let array = [1, 1, 2, 2, 3, 3]
//let unique = Set(array)
////print(unique)
///

func groupAnagrams(_ words: [String]) -> [[String]] {
    var anagramGroups: [String: [String]] = [:]

    for word in words {
        let sortedWord = String(word.sorted())

        if var group = anagramGroups[sortedWord] {
            group.append(word)
            anagramGroups[sortedWord] = group
        } else {
            anagramGroups[sortedWord] = [word]
        }
    }

    let groupedAnagrams = Array(anagramGroups.values)
    return groupedAnagrams
}
let wordList = ["eat", "tea", "tan", "ate", "nat", "bat"]
let result1 = groupAnagrams(wordList)
print(result1)


func printOccurrences(of targetNumber: Int, in array: [Int]) {
    array.forEach { number in
        if number == targetNumber {
            print(number)
        }
    }
}

let numbers1 = [1, 1, 2, 2, 3, 4, 4]

// Print all occurrences of the number 3
print(printOccurrences(of: 3, in: numbers1))





//
//let numbers = [1, 1, 2, 2, 3, 4, 4]
//
//// Use a Set to filter out duplicates
//let distinctNumbers = Array(Set(numbers))
//
//// Take the first three elements
//let result = Array(distinctNumbers.prefix(3))
//
//// Print the result
//print(result)

// Soulution - 1
let numbers = [1, 1, 2, 2, 3, 4, 4]
for item in numbers {
    if item == 3 {
        print(item)
        break
    }
}
// Soulution - 2
let result = numbers.filter { $0 == 3 }
print(result)
