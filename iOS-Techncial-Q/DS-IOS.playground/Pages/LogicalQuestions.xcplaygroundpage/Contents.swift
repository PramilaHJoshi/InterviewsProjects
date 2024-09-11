//import UIKit

var greeting = "Hello, playground"

func findPivotIndex(nums: [Int]) -> Int {
    let totalSum = nums.reduce(0, +)  // Calculate total sum of the array
    var leftSum = 0                   // Initialize left sum to 0
    
    for (index, num) in nums.enumerated() {
        let rightSum = totalSum - leftSum - num  // Calculate right sum
        print("###",rightSum, leftSum)
        if leftSum == rightSum {
            return index  // Return the pivot index when left sum equals right sum
        }
        leftSum += num  // Update left sum by adding the current number
    }
    
    return -1  // Return -1 if no pivot index is found
}

let nums5 = [2, 3, -1, 8, 4]
let pivotIndex = findPivotIndex(nums: nums5)
print("Pivot Index: \(pivotIndex)")


func stringDuplicate(_ s: [String]) -> [String: Int] {
    var counts: [String: Int] = [:]
    for elemnet in s {
        if let count = counts[elemnet] {
            counts[elemnet] = count + 1
        } else {
            counts[elemnet] = 1
        }
    }
    return counts
}

let stringDuplicates1 = stringDuplicate(["apple", "banana", "orange", "apple", "kiwi", "banana"])
print(stringDuplicates1)



// Find Missing Number
func missingNumber(_ nums: [Int]) -> Int {
    var elementTotal = 0
    var n = nums.count
    for num in nums {
        elementTotal += num
    }
    var expectedSum = n * (n+1)/2 //42
    return expectedSum - elementTotal // 42 - 26 = 16
}

let finalNumber = missingNumber([1,2,4,5,6,8])
print(finalNumber)


func lentghOfLastWord(_ s: String) -> Int {
    var lastLengthCount = 0
    var isNewWord = true
    for (_, char) in s.enumerated() {
        if char == " " {
            isNewWord = true
            continue
        }
        if isNewWord {
            lastLengthCount = 0
        }
        isNewWord = false
        lastLengthCount += 1
    }
    return lastLengthCount
    
//    var length = 0
//    var foundWord = false
//    print(s.reversed())
//    for char in s.reversed() {
//        print(char)
//        if char != " " {
//            length += 1
//            foundWord = true
//        } else if foundWord {
//            break
//        }
//    }
//    return length
}

// Example usage:
let example1 = "   fly me   to          the moon  "
print(lentghOfLastWord(example1))  // Output: 5

let example2 = "Swift programming language"
print(lentghOfLastWord(example2))  // Output: 8




let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbersINT = [16, 58, 510]

let strings = numbersINT.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

//Variadic Parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

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

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value couldn't be found for \(numberSymbol).")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)
// Prints "grtmndsthnklk"

func removeDuplicates(_ nums: inout [String]) -> Int {
    var uniqueArray = [String]()
    for element in nums {
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
    return uniqueArray.count
}
var duplicates = ["apple", "banana", "orange", "apple", "kiwi", "banana"]
print(removeDuplicates(&duplicates))

// Duplicate Count
func findDuplicateCount(duplicateString: [String]) {
    var counts: [String: Int] = [:]
    var duplicates: [String: Int] = [:]
    for elemnet in duplicateString {
        if let count = counts[elemnet] {
            counts[elemnet] = count + 1
        } else {
            counts[elemnet] = 1
        }
    }
    for (fruit, count) in counts {
        if count > 1 {
            duplicates[fruit] = count
        }
    }
    print(duplicates)
}
let arrayWithDuplicates1 = ["apple", "banana", "orange", "apple", "kiwi", "banana"]
findDuplicateCount(duplicateString: arrayWithDuplicates1)

// Removed numbers from String
func removeIntergersFromString(s: [String]) -> ([Int], [String]) {
    var integerArry:[Int] = []
    var stringArry:[String] = []
    for element in s {
        if let number = Int(element) {
          integerArry.append(number)
        } else {
            stringArry.append(element)
        }
    }
    return (integerArry, stringArry)
}
let getIntegers = removeIntergersFromString(s: ["1", "one", "2", "two", "3", "three"])
print(getIntegers)

// Sorting String Charecters
func bubbleSortString(_ str: String) -> String {
    var characters:[Character] = Array(str)
    let n = characters.count
    for i in 0..<n {
        for j in 0..<n-i-1 {
            if characters[j] > characters[j+1] {
                let temp = characters[j]
                characters[j] = characters[j+1]
                characters[j+1] = temp
            }
        }
        //        (characters[i], characters[n - 1 - i]) = (characters[n - 1 - i], characters[i])
    }

    return String(characters)
}

let originalString = "swift"
let sortedString = bubbleSortString(originalString)
print(sortedString) // Output: "fstiw"

// Sorting: Array Elements
var arrysList = [1,3,6,4,2,7,5]
var arrsyList1 = [4,7,8]
var arrsyList2 = [1,2,3]
func sortedArraysList() {
    var mergeList = arrsyList1 + arrsyList2
    for i in 0..<mergeList.count {
        for j in 0..<mergeList.count - i - 1 {
            if mergeList[j] > mergeList[j+1] {
                let temp = mergeList[j]
                mergeList[j] = mergeList[j+1]
                mergeList[j+1] = temp
            }
        }
    }
    print(mergeList)
}

sortedArraysList()


// Grouped Anagrams
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagramGroups: [String: [String]] = [:]
    for str in strs {
        // Sort the characters in the string
        let sortedStr = bubbleSortString(str)//String(str.sorted())
        // Group the anagrams together
        if anagramGroups[sortedStr] != nil {
            anagramGroups[sortedStr]!.append(str)
        } else {
            anagramGroups[sortedStr] = [str]
        }
    }
    // Return the values of the dictionary as an array of arrays
    return Array(anagramGroups.values)
}

// Example usage:
let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
let groupedAnagrams = groupAnagrams(strs)
print(groupedAnagrams)

// Add Strings Numbers
func addStrings(_ num1: String, _ num2: String) -> String {
    var result = ""
    var carry = 0
    var i = num1.count - 1
    var j = num2.count - 1
    
    let num1Array = Array(num1)
    let num2Array = Array(num2)
    
    while i >= 0 || j >= 0 || carry > 0 {
        let digit1 = i >= 0 ? Int(String(num1Array[i]))! : 0
        let digit2 = j >= 0 ? Int(String(num2Array[j]))! : 0
        
        let sum = digit1 + digit2 + carry
        carry = sum / 10
        result = "\(sum % 10)" + result
        
        i -= 1
        j -= 1
    }
    
    return result
}

let finalString = addStrings("11", "123")
print(finalString)

// Single Number
func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
        result ^= num
    }
    return result
}

let array = [1, 2, 2]
let result0 = singleNumber(array)
print("The single number is \(result0)")


//Valid Parntheis
func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else { return false }
    var stack: [Character] = []
    
    for item in s {
        switch item {
        case "(":
            stack.append(")")
        case "[":
            stack.append("]")
        case "{":
            stack.append("}")
        default:
            if stack.isEmpty || stack.removeLast() != item {
                return false
            }
        }
    }
    
    return stack.isEmpty
}
//Input: s = "()"
//Output: true
let a = isValid("()")
print(a)

func reverseWords(_ s: String) -> String {
    var words = [String]()
    var word = ""
    // Step 1: Collect words manually
    for char in s {
        if char != " " {
            word.append(char)
        } else if !word.isEmpty {
            words.append(word)
            word = ""
        }
    }
    // Add the last word if it exists
    if !word.isEmpty {
        words.append(word)
    }
    // Step 2: Reverse the words array in place
    var left = 0
    var right = words.count - 1
    
    while left < right {
        let temp = words[left]
        words[left] = words[right]
        words[right] = temp
        
        left += 1
        right -= 1
    }
    // Step 3: Build the result string manually
    var result = ""
    for (index, word) in words.enumerated() {
        result.append(word)
        if index < words.count - 1 {
            result.append(" ")
        }
    }
    return result
}

// Example usage
let s1 = "the sky is blue"
print(reverseWords(s1)) // Output: "blue is sky the"

let s2 = "  hello world  "
print(reverseWords(s2)) // Output: "world hello"

let s3 = "a good   example"
print(reverseWords(s3)) // Output: "example good a"


//func longestCommonPrefix(_ strs: [String]) -> String {
//    guard let firstStr = strs.first else { return "" }
//    
//    for i in 0..<firstStr.count {
//        let char = firstStr[firstStr.index(firstStr.startIndex, offsetBy: i)]
//        for str in strs {
//            if i == str.count || str[str.index(str.startIndex, offsetBy: i)] != char {
//                return String(firstStr.prefix(i))
//            }
//        }
//    }
//    
//    return firstStr
//}

func longestCommonPrefix(_ strs: [String]) -> String {
    guard let first = strs.first else { return "" }
    var Commonprefix = ""
    // Iterate through each character in the first string
    for Indexchar in first.indices {
        let currentChar = first[Indexchar]
        // Check if the current character is common to all strings
        for strIndex in 1..<strs.count {
            // Check if we reached the end of any string or if there is a mismatch
            if Indexchar == strs[strIndex].endIndex || currentChar != strs[strIndex][Indexchar] {
                return Commonprefix
            }
        }
        Commonprefix.append(currentChar)
    }
    return Commonprefix
}

// Example usage
let strs1 = ["flower", "flow", "flight"]
print(longestCommonPrefix(strs1))  // Output: "fl"

let strs2 = ["dog", "racecar", "car"]
print(longestCommonPrefix(strs2))  // Output: ""

// Merge Nested Array Into Single Array
func flatten(_ array: [Any]) -> [Int] {
    var resultArray: [Int] = []
    for elements in array {
        if let subArray = elements as? [Any] {
            resultArray.append(contentsOf: flatten(subArray))
        } else if let number = elements as? Int {
            resultArray.append(number)
        }
    }
    return resultArray
}
// Example usage
let input: [Any] = [3, 4, [2, 1], [5], [6], 7]
let output = flatten(input)
print(output)  // Output: [1, 2, 3, 4, 5, 6, 7]

//Higher Order Function
//Reduce
let n = [1, 2, 3, 4]
let sum1 = n.reduce(0) { $0 + $1 }
// sum is 10

func customReduce(_ array: [Int], initialResult: Int, nextPartialResult: (Int, Int) -> Int) -> Int {
    var result = initialResult
    for element in array {
        result = nextPartialResult(result, element)
    }
    return result
}

// Usage
let number3 = [1, 2, 3, 4]
let sum = customReduce(number3, initialResult: 0) { $0 + $1 }
print(sum) // Output: 10

//Filter
let number = [1, 2, 3, 4]
let evenNumbers1 = number.filter { $0 % 2 == 0 }
// evenNumbers is [2, 4]

func customFilter(_ array: [Int], predicate: (Int) -> Bool) -> [Int] {
    var result = [Int]()
    for element in array {
        if predicate(element) {
            result.append(element)
        }
    }
    return result
}
// Usage
let number1 = [1, 2, 3, 4]
let evenNumbers = customFilter(number1) { $0 % 2 == 0 }
print(evenNumbers) // Output: [2, 4]

//Map
let q = [1, 2, 3, 4]
let q1 = q.map { $0 * $0 }
// squaredNumbers is [1, 4, 9, 16]

func applyToEach(_ array: [Int], transform: (Int) -> Int) -> [Int] {
    var result = [Int]()
    for element in array {
        result.append(transform(element))
    }
    return result
}

// Usage
let numbers = [1, 2, 3, 4]
let squaredNumbers = applyToEach(numbers) { $0 * $0 }
print(squaredNumbers) // Output: [1, 4, 9, 16]


// Palidrome
func isPalindrome(_ number: Int) -> Bool {
    var temNumber = number
    var reverseNumber = 0
    while temNumber > 0 {
        let reminder = temNumber % 10
        reverseNumber = reverseNumber * 10 + reminder
        temNumber = temNumber / 10
    }
    return number == reverseNumber
}
// Example usage:
let number34 = 10
if isPalindrome(number34) {
    print("\(number34) is a palindrome.")
} else {
    print("\(number34) is not a palindrome.")
}

//169. Majority Element
func majorityElement(_ nums: [Int]) -> Int {
    var candidate: Int?
    var count = 0
    
    // Phase 1: Find the candidate
    for num in nums {
        if count == 0 {
            candidate = num
        }
        count += (num == candidate) ? 1 : -1
    }
    
    // Phase 2: Return the candidate
    return candidate!
}

// Example usage:
let nums2 = [3, 2, 2, 3]
let result = majorityElement(nums2)
print(result)  // Output: 3

func isPalindrome(_ s: String) -> Bool {
    let characters = Array(s)
    var leftIndex = 0
    var rightIndex = characters.count - 1

    while leftIndex < rightIndex {
        print(characters[leftIndex], characters[rightIndex])
        if characters[leftIndex] != characters[rightIndex] {
            return false
        }
        leftIndex += 1
        rightIndex -= 1
    }

    return true
}

func printPalindromeWords(from text: String) {
    //let words = text.split(separator: " ").map { String($0) }
    var words: [String] = []
    var currentWord = ""
    for character in text {
        if character.isWhitespace {
            if !currentWord.isEmpty {
                words.append(currentWord)
                currentWord = ""
            }
        } else {
            currentWord.append(character)
        }
    }
    // Append the last word if there is one
    if !currentWord.isEmpty {
        words.append(currentWord)
    }
    for word in words {
        if isPalindrome(word) {
            print(word)
        }
    }
}

// Example usage:
let sentence = "madam and racecar are level palindromes but not all words are"
printPalindromeWords(from: sentence)

//// Example usage:
//let word = "radar"
//if isPalindrome(word) {
//    print("\(word) is a palindrome.")
//} else {
//    print("\(word) is not a palindrome.")
//}
func reverse(_ x: Int) -> Int {
    let INT_MAX = Int32.max
    let INT_MIN = Int32.min
    var num = x
    var reversed = 0
    while num != 0 {
        let digit = num % 10
        num /= 10
        // Check for overflow before actually adding the digit to reversed
        if reversed > (Int(INT_MAX) - digit) / 10 {
            return 0
        }
        reversed = reversed * 10 + digit
    }
    
    return reversed
}

// Example usage
print(reverse(123))  // Output: 321
print(reverse(-123)) // Output: -321
print(reverse(120))  // Output: 21


func indexOfFirstOccurrence(mainString: String, substring: String) -> Int? {
    let mainArray = Array(mainString)
    let subArray = Array(substring)
    
    guard subArray.count <= mainArray.count else {
        return nil
    }
    
    for i in 0...(mainArray.count - subArray.count) {
        var match = true
        for j in 0..<subArray.count {
            if mainArray[i + j] != subArray[j] {
                match = false
                break
            }
        }
        if match {
            return i
        }
    }
    
    return nil
}

// Example usage
let mainString = "sadbutsad"
let substring = "sad"
if let index = indexOfFirstOccurrence(mainString: mainString, substring: substring) {
    print("The index of the first occurrence is \(index)")
} else {
    print("Substring not found")
}

// Rotate Elements
func rotate(_ nums: inout [Int], _ k: Int) {
    let n = nums.count
    let steps = k % n
    // Step 1: Reverse the entire array
    reverse(&nums, start: 0, end: n - 1)
    // Step 2: Reverse the first k elements
    reverse(&nums, start: 0, end: steps - 1)
    // Step 3: Reverse the remaining n - k elements
    reverse(&nums, start: steps, end: n - 1)
}

func reverse(_ nums: inout [Int], start: Int, end: Int) {
    var start = start
    var end = end
    while start < end {
        let temp = nums[start]
        nums[start] = nums[end]
        nums[end] = temp
        start += 1
        end -= 1
    }
}

// Example usage
var nums1 = [1, 2, 3, 4, 5, 6, 7]
let k = 3
rotate(&nums1, k)
print(nums1)

// Removed Duplicates
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var tempArray = [Int]()
    for unique in nums {
        if !tempArray.contains(unique) {
            tempArray.append(unique)
        }
    }
    print(tempArray)
    return tempArray.count
    /*
     var uniqueArray = [Int]()
     for element in nums {
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
     return uniqueArray.count
     */
}
var array1 = [1,1,2]
print(removeDuplicates(&array1))

// Two Sum
func twoSum(_ nums: [Int], _ target: Int) -> [Int]? {
    var tempDic = [Int: Int]()
    for (i, num) in nums.enumerated() {
        let complement = target - num
        if let index = tempDic[complement] {
            return [index, i]
        }
        tempDic[num] = i
    }
    return []
}

let nums = [3, 7, 9, 15]
let target = 9

if let result = twoSum(nums, target) {
    print("Indices of the two numbers that add up to \(target): \(result)")
} else {
    print("No two numbers add up to \(target)")
}
