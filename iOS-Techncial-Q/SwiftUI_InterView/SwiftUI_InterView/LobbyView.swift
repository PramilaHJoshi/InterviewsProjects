//
//  LobbyView.swift
//  SwiftUI_InterView
//
//  Created by Pradeep Kumar Yeligandla on 27/08/24.
//

import SwiftUI

struct CounterView: View {
   @State private var count = 0

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button(action: {
                count += 1 // This change does not trigger a view update
            }) {
                Text("Increment")
            }
        }
    }
}

struct LobbyView: View {
    @EnvironmentObject var setting: Settings
    @State private var isExpanded = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Rectangle()
                    .frame(width: 100, height: isExpanded ? geometry.size.height : 50)
                    .animation(.easeOut, value: 0.1)
                    .onTapGesture {
                        isExpanded.toggle()
                    }
            }
        }
    }
}

#Preview {
    CounterView()
}
