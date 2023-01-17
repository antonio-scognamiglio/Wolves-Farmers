//
//  ContentView.swift
//  Wolves&Farmers
//
//  Created by Antonio Scognamiglio on 16/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gamerSession : GamerMultiPeerSession
    var numberOfPlayer: NumberOfPlayers = .six
    
    var cards: [String] {
        switch numberOfPlayer {
        case .six:
            return ["Wolf", "Seer", "Guardian", "Farmer", "Farmer", "Farmer"]
        case .seven:
            return ["Wolf", "Seer", "Guardian", "Farmer", "Farmer", "Farmer", "Farmer"]
        case .eight:
            return ["Wolf", "Wolf", "Seer", "Guardian", "Farmer", "Farmer", "Farmer", "Farmer"]
        case .nine:
            return ["Wolf", "Wolf", "Seer", "Guardian", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer"]
        case .ten:
            return ["Wolf", "Wolf", "Seer", "Guardian", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer"]
        case .eleven:
            return ["Wolf", "Wolf", "Seer", "Guardian", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer"]
        case .twelve:
            return ["Wolf", "Wolf", "Wolf", "Seer", "Guardian", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer", "Farmer"]
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                NavigationLink(destination: AddNickname(gamerSession: gamerSession)) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.black)
                        .overlay(
                            Text("Start")
                                .bold()
                                .foregroundColor(.white))
                        .frame(width: 120, height: 45)
                }
            }
            .padding()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(gamerSession: .init())
//    }
//}
