//
//  PumpApp.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 2/28/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct MidtermApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userInfo: UserInfo = UserInfo()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userInfo)
        }
    }
}
