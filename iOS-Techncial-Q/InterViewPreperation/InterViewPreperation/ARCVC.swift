//
//  ARCVC.swift
//  InterViewPreperation
//
//  Created by Pradeep Kumar Yeligandla on 27/08/24.
//

import UIKit
import MyFramework


class MainClass: CustomClass {
    
}

struct AppleProduct {
    var name: String
    var price: Double
}

func lengthOfLongestSubstring1(_ s: String) -> Int {
    var charIndexDict = [Character: Int]()
    var left = 0
    var maxLength = 0
    
    for (right, char) in s.enumerated() {
        if let lastSeenIndex = charIndexDict[char], lastSeenIndex >= left {
            left = lastSeenIndex + 1
        }
        charIndexDict[char] = right
        
        let currentLength = right - left + 1
        if currentLength > maxLength {
            maxLength = currentLength
        }
    }
    print(maxLength)
    return maxLength
}


func isSubsequence(_ s: String, _ t: String) -> Bool {
    var sPointer = 0
    var tPointer = 0
    var sCount = s.count
    var tCount = t.count
    
    while sPointer < sCount && tPointer < tCount {
        if Array(s)[sPointer] == Array(t)[tPointer] {
            sPointer += 1
        }
        tPointer += 1
    }
    
    return sPointer == sCount
    
    
//    var sIndex = 0
//    for char in t {
//        if sIndex < s.count && s[s.index(s.startIndex, offsetBy: sIndex)] == char {
//            sIndex += 1
//        }
//    }
//    return sIndex == s.count
    
    //    let sArray = Array(s)
    //    let tArray = Array(t)
    //    for i in 0...sArray.count - tArray.count {
    //        var match = true
    //        for j in 0..<tArray.count {
    //            if sArray[i+j] != tArray[j] {
    //                match = false
    //                break
    //            }
    //        }
    //        if match {
    //            return i
    //        }
    //    }
    //
    //    return -1
}

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagramGroups: [String: [String]] = [:]
    for str in strs {
        // Sort the characters in the string
        let sortedStr = String(str.sorted())
        
        // Group the anagrams together
        if anagramGroups[sortedStr] != nil {
            anagramGroups[sortedStr]!.append(str)
        } else {
            anagramGroups[sortedStr] = [str]
        }
    }
    print(anagramGroups)
    return Array(anagramGroups.values)
}

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
    
//    for i in 0..<list1.count - 1 {
//        for j in 0..<list2.count {
//            if list2[j] > list1[i] && list2[j] < list1[i + 1] {
//                list1[i + 1] = list2[j]
//                list1[i + 1].append(list2[j])
//                print(list1)
//            }
//        }
//    }
    
}


class ARCVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mergingTwoArrays()
        // Example usage
        var nums1 = [1, 2, 3, 0, 0, 0]
        let nums2 = [2, 5, 6]
        let m = 3
        let n = 3
        merge(&nums1, m, nums2, n)
        
        
        var grouped = groupAnagrams(["eat","tea","tan","ate","nat","bat"])
        print(grouped)
        
//        let isDubsequenceChar = isSubsequence("butsad", "sad")
//        print(isDubsequenceChar)
        
//        let subString = isSubsequence("ace", "abcde")
//        print(subString)
        
        //let longg = lengthOfLongestSubstring1("abcabcbb")
        
        
        
        
        
        // Do any additional setup after loading the view.
        var product1 = AppleProduct(name: "iPhoneSE", price: 999.0)
        var product2 = product1
        
        // Print the memory address of product1
        withUnsafePointer(to: &product1) { pointer in
            print("Memory address of product1: \(pointer)")
        }

        // Print the memory address of product2
        withUnsafePointer(to: &product2) { pointer in
            print("Memory address of product2: \(pointer)")
        }
        
     
        var array1 = [1,2,3,4]
        var array2 = array1
        
        array2.append(5)
        
        // Check if array1 and array2 share the same memory address
        // Print the memory address of array1
        array1.withUnsafeBufferPointer { buffer1 in
            if let address1 = buffer1.baseAddress {
                print("Memory address of array1: \(address1)")
            } else {
                print("array1 has no base address.")
            }
        }
        
        // Print the memory address of array2
        array2.withUnsafeBufferPointer { buffer2 in
            if let address2 = buffer2.baseAddress {
                print("Memory address of array2: \(address2)")
            } else {
                print("array2 has no base address.")
            }
        }
    }
    
    
//    class Person2 {
//        var name: String
//
//        init(name: String) {
//            self.name = name
//        }
//        var apartment: Apartment?
//
//        deinit {
//            print("\(name) is being deinitialized")
//        }
//    }
//
//    class Apartment {
//        let unit: String
//        init(unit: String) {
//            self.unit = unit
//        }
//        weak var tenant: Person2?
//        deinit {
//            print("Apartment \(unit) is being deinitialized")
//        }
//    }
    
    
//    var john: Person2?
//    var unit4A: Apartment?
//
//    john = Person2(name: "John Appleseed")
//    unit4A = Apartment(unit: "4A")
//
//    john!.apartment = unit4A
//    unit4A!.tenant = john
//
//    print(john!.apartment!, unit4A!.tenant!)
//
//    john = nil
//    unit4A = nil

}
