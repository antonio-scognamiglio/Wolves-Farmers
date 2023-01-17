//
//  WolvesFarmersApp.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 16/01/23.
//

import SwiftUI

@main
struct WolvesFarmersApp: App {
    @StateObject var gamerSession = GamerMultiPeerSession()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(gamerSession: gamerSession)
        }
    }
}
