//
//  ContentView.swift
//  Wolves&Farmers
//
//  Created by Antonio Scognamiglio on 16/01/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gamerSession : GamerMultiPeerSession
    @EnvironmentObject var cardModel: CardViewModel
    @AppStorage("showOnboarding") private var showOnboarding = true
    @State var isCreate = false
    @State var isJoin = false
    
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
            
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack (spacing: 10) {
                    Spacer()
                    NavigationLink(destination: GameRulesView()) {
                        HStack(spacing: 15) {
                            Text("How to Play?")
                            Image(systemName: "info.circle")
                        }.foregroundColor(Color.yellowButton)
                            .buttonStyle(BorderlessButtonStyle())
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 8.50)
                            .background(Color(UIColor(named: "1E1F24Color")!))
                            .cornerRadius(30)
                    }.padding(.bottom, 100)
                   
                    Image("wolfIcon")
                    
                    Spacer()
                    
                    NavigationLink(destination: CreateGameView(), isActive: $isCreate) {
                        Button(action: {
//                            cardModel.isMaster = gamerSession.send(isMaster: true)
                            isCreate.toggle()
                        }) {
                            Text("Create a new game")
                                .foregroundColor(.black)
                                .buttonStyle(BorderlessButtonStyle())
                                .padding(.horizontal, 30)
                                .padding(.vertical, 15)
                                .frame(width: UIScreen.main.bounds.width / 1.10, height: UIScreen.main.bounds.width / 8.50)
                                .background(Color(UIColor(named: "ChevronColor")!))
                                .cornerRadius(12)
                        }
                        
                    }
                  
                    NavigationLink(destination: CharacterAssignedView(), isActive: $isJoin) {
                        Button(action: {
//                            cardModel.isPlayer = !gamerSession.send(isMaster: false)
                            isJoin.toggle()
                        }) {
                            Text("Join a game")
                                .foregroundColor(Color.yellowButton)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 15)
                                .frame(width: UIScreen.main.bounds.width / 1.10, height: UIScreen.main.bounds.width / 8.50)
                                .background(Color.backgroundColor)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.yellowButton, lineWidth: 1)
                                )
                        }
                        
                    }
               
                    Spacer()
                    
                }
            }
        }
        .fullScreenCover(isPresented: $showOnboarding){
            OnBoardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gamerSession: .init())
    }
}
