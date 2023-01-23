//
//  CreateGameView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 18/01/23.
//

import SwiftUI

struct CreateGameView: View {
    @EnvironmentObject var gamerSession : GamerMultiPeerSession
    @EnvironmentObject var cardModel: CardViewModel
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                HeaderView(title: "Step 1/3", subtitle: "Creating a new game")
                    .padding(.bottom, 100)
            SearchingCardView()
                    .overlay {
                        VStack {
                            Image(systemName: "exclamationmark.circle")
                                .foregroundColor(.red)
                                .font(.largeTitle)
                                
                            Text("You will be automatically assigned as The Storyteller. Ask your friends to join the game with the same Wi-Fi connection and make sure Bluetooth is turned on.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }

                NavigationLink(destination: SearchingPlayersView()) {
                    BigButtonView(text: "Understand", textColor: .black, backgroundColor: .yellowButton)
                        .padding(.top, 40)
                }

            }
        }
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}
