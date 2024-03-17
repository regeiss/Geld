//
//  GeldApp.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 27/02/24.
//

import SwiftUI
import FirebaseCore

@main
struct GeldApp: App
{
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage("contextSet") private var contextSet: Bool = false
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate 
{
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool 
    {
    FirebaseApp.configure()
    return true
  }
}
