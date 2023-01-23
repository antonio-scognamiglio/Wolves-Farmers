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
    
    @StateObject var cardModel = CardViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(gamerSession)
                .environmentObject(cardModel)
                .onAppear() {
                    saveUsername()
                    gamerSession.viewModel = cardModel
                }
        }
    }
    
    func saveUsername() {
        cardModel.username = gamerSession.myPeerId.displayName
    }
}
