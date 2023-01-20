//
//  SearchingPlayersView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct SearchingPlayersView: View {
    @EnvironmentObject var gamerSession: GamerMultiPeerSession
    @EnvironmentObject var cardModel: CardViewModel
    
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
                .padding()
                
                List(gamerSession.connectedPeers, id: \.self) { peer in
                   Text(peer.displayName)
                        .foregroundColor(.black)
                        .onAppear {
//                            cardModel.users.append(peer.displayName)
//                            print("CardModel username = \(cardModel.users)")
                        }
                }

                .padding(.horizontal)
                .listStyle(GroupedListStyle())
                .scrollContentBackground(.hidden)
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.width / 1.20, height: UIScreen.main.bounds.height / 2.1)
                .background {
                    SearchingCardView()
                }
                
                NavigationLink(destination: CharacterListView()) {
                    BigButtonView(text: "Next", textColor: .black, backgroundColor: .yellowButton)
                        .padding(.top, 30)
                }
                
            }
        }
    }
}

struct SearchingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayersView(gamerSession: .init())
            .environmentObject(CardViewModel())
            .environmentObject(GamerMultiPeerSession())
    }
}
