//
//  FilePrivate.swift
//  InterViewPreperation
//
//  Created by Pradeep Kumar Yeligandla on 27/08/24.
//

import Foundation


class PersonClass {
    fileprivate var fileprivateProperty: String = "Fileprivate Property"
}

class ChildClass {
    
    func accesMyClass() {
        var persCalss =  PersonClass()
        print(persCalss.fileprivateProperty)
    }
}
