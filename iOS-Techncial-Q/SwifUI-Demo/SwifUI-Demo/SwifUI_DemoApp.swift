//
//  SwifUI_DemoApp.swift
//  SwifUI-Demo
//
//  Created by Pradeep Kumar Yeligandla on 02/09/24.
//

import SwiftUI
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        // Custom initialization code
    }
}

@main
struct SwifUI_DemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            SchoolListView()
        }
    }
}
