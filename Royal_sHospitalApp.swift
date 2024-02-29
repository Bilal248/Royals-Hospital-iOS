//
//  Royal_sHospitalApp.swift
//  Royal'sHospital
//
//  Created by Bilal's MacBook👑 on 02/02/2024.
//

import SwiftUI
import FirebaseFirestore
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


//Screen to open when the App starts
@main
struct Royal_sHospitalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
