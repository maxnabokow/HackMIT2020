//
//  HackMIT2020App.swift
//  Shared
//
//  Created by Max Nabokow on 9/19/20.
//

import SwiftUI
import StreamChatClient

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Configure StreamChat
        Client.configureShared(.init(apiKey: Keys.STREAM_CHAT_API_KEY, logOptions: .info))
        
        return true
    }
}

@main
struct HackMIT2020App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
