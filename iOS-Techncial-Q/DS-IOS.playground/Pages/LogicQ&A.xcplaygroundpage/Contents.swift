import Foundation

// Add 2 Capital Letters

func filterCapitalCharacters(fromString input: String) -> String? {
    //    guard input.isEmpty == false else { return nil}
    //    let result = input.filter ({("A"..."Z") .contains ($0)})
    //    return result
    guard !input.isEmpty else { return nil }
    var result = ""
    for character in input {
        if character >= "A" && character <= "Z" {
            result.append(character)
        }
    }
    return result
}
let getCapsLteer = filterCapitalCharacters(fromString: "Pradeep Kumar")

// Merge 2 Arrays

func mergingTwoArrays() {
    let list1 = [1,3,5,7]
    let list2 = [2,4,6]
    var result = [Int]()
    // Indices for list1 and list2
    var i = 0
    var j = 0
    while i < list1.count && j < list2.count  {
        if list1[i] < list2[j] {
            result.append(list1[i])
            i += 1
        } else {
            result.append(list2[j])
            j += 1
        }
    }
}

/*
 88. Merge Sorted Array
 Example 1:

 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 */

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1
    var j = n - 1
    var k = m + n - 1
    
    while j >= 0 {
        if i >= 0 && nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            i -= 1
        } else {
            nums1[k] = nums2[j]
            j -= 1
        }
        k -= 1
    }
}
// Example usage
var nums1 = [1, 2, 3, 0, 0, 0]
let nums2 = [2, 5, 6]
let m = 3
let n = 3
merge(&nums1, m, nums2, n)


/*
 49. Group Anagrams
 Example 1:
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 */


func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagramGroups = [String: [String]]()
    for item in strs {
        let sortedStr = String(item.sorted())
        if anagramGroups[item] != nil  {
            anagramGroups[sortedStr]!.append(item)
        } else {
            anagramGroups[sortedStr] = [item]
        }
    }
    return Array(anagramGroups.values)
}

/*
 242. Valid Anagram
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 */

func validAnagrams(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var sCount = [Character: Int]()
    var tCount = [Character: Int]()
    
    for charS in s {
        sCount[charS, default: 0] += 1
        if let currentCount = sCount[charS] {
            sCount[charS] = currentCount + 1
        } else {
            sCount[charS] = 1
        }
    }
    
    for charT in t {
        if let currentCount = tCount[charT] {
            tCount[charT] = currentCount + 1
        } else {
            tCount[charT] = 1
        }
    }
    
    return sCount == tCount
    
//    var count = [Character: Int]()
//    for (charS, charT) in zip(s, t) {
//        if let currentCount = count[charS] {
//            count[charS] = currentCount + 1
//        } else {
//            count[charS] = 1
//        }
//        
//        if let currentCount = count[charT] {
//            count[charT] = currentCount - 1
//        } else {
//            count[charT] = -1
//        }
//    }
//    count.values.allSatisfy { $0 == 0 }
//    // Check if all counts are zero
//    for value in count.values {
//        if value != 0 {
//            return false
//        }
//    }
//    return true
}

let isValidAnagram  = validAnagrams("rat", "cat")

//3. Longest Substring Without Repeating Characters
/*
 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var charecterArray = [Character: Int]()
    var start = 0
    var maxLenth = 0
    
    for (index, char) in s.enumerated() {
        if let lastSeenIndex = charecterArray[char], lastSeenIndex >= start {
            start = lastSeenIndex + 1
        }
        // Update the maxLength after calculating the new start
        let currentLength = index - start + 1
        if currentLength > maxLenth {
            maxLenth = currentLength
        }
        charecterArray[char] = index
    }
    return maxLenth
}



/*209. Minimum Size Subarray Sum

Given an array of positive integers nums and a positive integer target, return the minimal length of a
subarray
 whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.
Example 1:
Input: target = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: The subarray [4,3] has the minimal length under the problem constraint.*/


//TODO:




//28. Find the Index of the First Occurrence in a String
//Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//Example 1:
//Input: haystack = "sadbutsad", needle = "sad"
//Output: 0
//Explanation: "sad" occurs at index 0 and 6.
//The first occurrence is at index 0, so we return 0.
func strStr(_ haystack: String, _ needle: String) -> Int {
    let window = needle.count
    let arr = Array(haystack)
    if window > arr.count {
        return -1
    }
    for i in 0...arr.count - window {
        let str = String(arr[i..<i + window])
        if str == needle {
            return i
        }
    }
    return -1
}
let indexFound = strStr("sadbutsad", "sad")
print(indexFound)

//func deferFunction() {
//    print("Print -- 1")
//    
//    defer {
//        print("Print -- 2 (deferred)")
//    }
//    
//    print("Print -- 3")
//    
//    do {
//        print("Print -- 4 (do)")
//    }
//    
//    defer {
//        print("Print -- 5 (deferred)")
//    }
//    print("Print -- 6")
//    
//}
//
//deferFunction()

let array1 = [1,2,3,4]
let array2 = array1

struct AppleProduct {
    var name: String
    var price: Int
}

let product1 = AppleProduct(name: "iPhone 15 Plus", price: 70000)
let product2 = product1

//1. Two Sum
/*
 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numToIndex = [Int: Int]()
    for (i, num) in nums.enumerated() {
        let complement = target - num
        if let index = numToIndex[complement] {
            return [index, i]
        }
        numToIndex[num] = i
    }
    return []
}

//167. Two Sum II - Input Array Is Sorted
func twoSum1(_ numbers: [Int], _ target: Int) -> [Int] {
    var left1 = 0
    var right1 = numbers.count - 1
    while left1 < right1 {
        var sum = numbers[left1] + numbers[right1]
        if sum == target {
            return [left1, right1]
        } else if sum < target {
            left1 = left1 + 1
        } else {
            right1 = right1 - 1
        }
    }
   return []
}
let num = [2, 7, 11, 15]
let target = 9
let result = twoSum1(num, target)
//392. Is Subsequence
//A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
/*
 Example 1:

 Input: s = "abc", t = "ahbgdc"
 Output: true
 */
func isSubsequence(_ s: String, _ t: String) -> Bool {
    if (s.count == 0){
        return true
    }
    var flag = 0
    let arr = Array(s)
    for i in t{
        if(i == arr[flag]){
            flag += 1
            if(s.count == flag){
                return true
            }
        }
    }
    return false
}
let subString = isSubsequence("sundar", "sdn")
print(subString)
/*
 125. Valid Palindrome
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
 Given a string s, return true if it is a palindrome, or false otherwise.
 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 */

func isPalindrome(_ s: String) -> Bool {
   // let filteredString = s.lowercased().filter {$0.isLetter || $0.isNumber }
    // return filteredString == String(filteredString.reversed())
    // Step 1: Filter out non-alphanumeric characters and convert to lowercase
    var filteredString = ""
    for item in s.lowercased() {
        if item.isLetter || item.isNumber {
            filteredString.append(item)
        }
    }
    let length = filteredString.count
    let characters = Array(filteredString)
    
    var left = 0
    var right = length - 1
    
    while left < right {
        if characters[left] !=  characters[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
   
}


let isValidPalindrome = isPalindrome("A man, a plan, a canal: Panama")

//151. Reverse Words in a String
//Input: s = "the sky is blue"
//Output: "blue is sky the"
func reverseWords(_ s: String) -> String {
    var words = [String]()
    var currentWord = ""
    for char in s {
        if char == " " {
            if !currentWord.isEmpty {
                words.insert(currentWord, at: 0)
                currentWord = ""
            }
        } else {
            currentWord.append(char)
        }
    }
    if !currentWord.isEmpty {
        words.insert(currentWord, at: 0)
    }
    return words.joined(separator: " ")
}
reverseWords("the sky is blue")

//14. Longest Common Prefix

//Input: strs = ["flower","flow","flight"]
//Output: "fl"
func longestCommonPrefix(strs: [String]) -> String {
    if strs.isEmpty { return "" }
    var common = strs[0]
    for ch in strs {
        while !ch.hasPrefix(common) {
            common = String(common.dropLast())
        }
    }
    return common
    
//    var commonPrefix = ""
//    if let first = strs.first {
//        for (i, char) in first.enumerated() {
//            for string in strs {
//                if i >= string.count || string[string.index(string.startIndex, offsetBy: i)] != char {
//                    return commonPrefix
//                }
//            }
//            commonPrefix.append(char)
//        }
//    }
//    return commonPrefix
}
let longestPrefix = longestCommonPrefix(strs: ["flower","flow","floght"])
print(longestPrefix)

//[1,2,[3,4,[5]],[6],7]
func flatten(array:[Any]) -> [String] {
    var resultArray: [String] = []
    for item in array {
        if let subArray = item as? [Any] {
            resultArray.append(contentsOf: flatten(array: subArray))
        } else if let num = item as? String {
            resultArray.append(num)
        }
    }
    return resultArray
}

let flattenedArray = flatten(array: ["1","2",["3","4",["5"]],["6"],"7"])
print(flattenedArray)




// Duplicate Count
func findDuplicateCount(duplicateString: [String]) {
    var counts: [String: Int] = [:]
   // var duplicates: [String: Int] = [:]
    for elemnet in duplicateString {
        if let count = counts[elemnet] {
            counts[elemnet] = count + 1
        } else {
            counts[elemnet] = 1
        }
    }
//    for (fruit, count) in counts {
//        if count > 1 {
//            duplicates[fruit] = count
//        }
//    }
    
    // Identify duplicates
    let duplicates = duplicateString.filter { $0.hashValue > 1 }
       
       print("Counts:", counts)
       print("Duplicates:", duplicates)
}
let arrayWithDuplicates1 = ["apple", "banana", "orange", "apple", "kiwi", "banana"]
findDuplicateCount(duplicateString: arrayWithDuplicates1)


func lengthOfLastWord(_ s: String) -> Int {
    let trimmedString = s.trimmingCharacters(in: .whitespacesAndNewlines)
    guard let lastWord = trimmedString.split(separator: " ").last else {
        return 0
    }
    return lastWord.count
}

let length = lengthOfLastWord("Hello Swift World")
print(length)



func reverseString(_ s: String) {
    var characters = Array(s)
    let n = characters.count
    for i in 0..<n/2 {
        let temp = characters[i]
        characters[i] = characters[n - i - 1]
        characters[n - i - 1] = temp
    }
    String(characters)
}

reverseString("Hello World")


func reverseInt(_ s: [Int]) {
    var tempArray = s // Initialize tempArray with the original array
    for i in 0..<tempArray.count {
        for j in 0..<tempArray.count - i - 1 {
            if tempArray[j] < tempArray[j + 1] {
                let temp = tempArray[j]
                tempArray[j] = tempArray[j+1]
                tempArray[j+1] = temp
            }
        }
    }
    print(tempArray)
}
reverseInt([2,6,5,8,2,9,1,0])


/*
 let rawDataString = """
 "fruits" : [ {
 "price" : 43
 "quantity" : "3"
 "name" : "mango"
 },
 {
 "price" : 3
 "quantity" : "33"
 "name" : "lemon"
 }],
 "vegatables" : [ {
 "price" : 4
 "quantity" : "33"
 "name" : "tamoto"
 },
 {
 "price" : 344
 "quantity" : "331"
 "name" : "Onion"
 }]
 """

 struct Model1: Codable {
     var fruits = [Model1]()
     var vegatables = [Mdoel2]()
 }

 struct Mdoel2: Codable {
     var price: Int
     var quantity: String
     var name: String
 }

 func createdJsonModel() {
     var jsonDecode = JSONDecoder()
     do {
         let jsosnadata = try jsonDecode.decode(Model1.self, from: rawDataString.data(using: .utf8)!)
         print(jsosnadata)
     } catch {
         print(error)
     }
 }
 createdJsonModel()
























 */
