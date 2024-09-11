//
//  SwiftUI_InterViewApp.swift
//  SwiftUI_InterView
//
//  Created by Pradeep Kumar Yeligandla on 27/08/24.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var themeColor: Color = .black
    // other settings...
}

@main
struct SwiftUI_InterViewApp: App {
    @StateObject var settings = Settings()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
