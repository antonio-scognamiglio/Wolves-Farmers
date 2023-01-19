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
    @Environment(\.dismiss) var dismiss
    @Binding var dismissAll: Bool
    
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
                
                NavigationLink(destination: CharacterListView(dismissAll: $dismissAll)) {
                    BigButtonView(text: "Next", textColor: .black, backgroundColor: .yellowButton)
                        .padding(.top, 30)
                        .onChange(of: dismissAll) { _ in
                            if (dismissAll == true) {
                                dismiss()
                            }
                            
                        }
                }
                
            }
        }
    }
}

struct SearchingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayersView(gamerSession: .init(), dismissAll: .constant(true))
            .environmentObject(CardViewModel())
            .environmentObject(GamerMultiPeerSession())
    }
}
