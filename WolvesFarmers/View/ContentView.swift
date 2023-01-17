//
//  ContentView.swift
//  Wolves&Farmers
//
//  Created by Antonio Scognamiglio on 16/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gamerSession : GamerMultiPeerSession
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                NavigationLink(destination: GameView(gamerSession: gamerSession)) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gamerSession: .init())
    }
}
