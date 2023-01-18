//
//  SearchingPlayersView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct SearchingPlayersView: View {
    @ObservedObject var gamerSession: GamerMultiPeerSession
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                HeaderView(title: "Step 2/3", subtitle: "Searching for players...")
                
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                        .font(.title2)
                        .bold()
                    Text("Minimum of 6 players are required")
                        .foregroundColor(.white)
                }
                
                
                List {
//                    ForEach(1..<6) { i in
//                        Text("iPhone \(i)")
//                    }
                    Text(String(describing: gamerSession.connectedPeers.map(\.displayName)))
                }
                .padding(.horizontal)
                .listStyle(GroupedListStyle())
                .scrollContentBackground(.hidden)
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.width / 1.20, height: UIScreen.main.bounds.height / 2)
                .background {
                    SearchingCardView()
                }
                
                // Should be disabled if less than 6 people are connected
                Button {
                    // Action
                } label: {
                    BigButtonView(text: "Next", textColor: .black, backgroundColor: .yellowButton)
                        .padding(.vertical)
                }
            }
        }
    }
}

struct SearchingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayersView(gamerSession: .init())
    }
}
