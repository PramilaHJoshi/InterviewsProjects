//
//  Login.swift
//  InterViewPreperation
//
//  Created by Pradeep Kumar Yeligandla on 27/08/24.
//

import Foundation

 var rawDataString = """
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
 

struct Model {
    var fruits: [ModelObject]?
}

struct ModelObject: Codable {
    var price: Int
    var quantity: Int
    var name: String
}

class LoginClass {
    
    let number: Int = 10
    let text: String = "Hello"
    
    func accesMyClass() {
        var persCalss =  PersonClass()
        let jsonData = rawDataString.data(using: .utf8)!
        print(rawDataString.data(using: .utf8)!)
    
        
        
        
        //print(persCalss.`   `)
        var rawData = Model()
        print(rawData.fruits ?? [])
        
    }
}

class MyClass {
    private var privateVar = "I am private"
    fileprivate var privateVar1 = "I am private"
    func printPrivateVar() {
        print(privateVar)
    }
}

extension MyClass {
    func accessPrivateVar() {
        // Cannot access `privateVar` here
        // print(privateVar)  // This will cause a compile-time error
        // Can use other public or internal methods
        print("Accessing private variable indirectly", privateVar, privateVar1)
        printPrivateVar()  // This works because `printPrivateVar` is public
    }
}


func modifyValue(_ value: Int) {
    var localValue = value
    localValue += 1
    print("Inside function: \(localValue)")
}

