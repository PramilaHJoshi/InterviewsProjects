//
//  ContentView.swift
//  SwiftUI_InterView
//
//  Created by Pradeep Kumar Yeligandla on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: Settings
    var body: some View {
        // Use settings.themeColor or other properties
        Text("Current Theme Color")
            .foregroundColor(settings.themeColor)
        // Other view components...
    }
}

#Preview {
    ContentView()
        .environmentObject(Settings())
}
