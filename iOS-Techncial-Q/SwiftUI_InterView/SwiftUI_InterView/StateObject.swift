//
//  StateObject.swift
//  SwiftUI_InterView
//
//  Created by Pradeep Kumar Yeligandla on 02/09/24.
//

import SwiftUI

struct StateObject: View {
    
   @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
            Button("Increament") {
                counter += 1
            }
        }
    }
}

#Preview {
    StateObject()
}
