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
    
    //    var numberOfPlayer: NumberOfPlayers = .six
    //
    //    var cards: [Card] {
    //        switch numberOfPlayer {
    //        case .six:
    //            return [Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Seer", image: Image("Seer")),
    //                    Card(name: "Guardian", image: Image("Guardian")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer"))]
    //        case .seven:
    //            return [Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Seer", image: Image("Seer")),
    //                    Card(name: "Guardian", image: Image("Guardian")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer"))]
    //        case .eight:
    //            return [Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Seer", image: Image("Seer")),
    //                    Card(name: "Guardian", image: Image("Guardian")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer"))]
    //
    //        case .nine:
    //            return [Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Seer", image: Image("Seer")),
    //                    Card(name: "Guardian", image: Image("Guardian")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer"))]
    //
    //        case .ten:
    //            return [Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Seer", image: Image("Seer")),
    //                    Card(name: "Guardian", image: Image("Guardian")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer"))]
    //
    //        case .eleven:
    //            return [Card(name: "Wolf",
    //                         image: Image("WolfGameOver")),
    //                    Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Seer", image: Image("Seer")),
    //                    Card(name: "Guardian", image: Image("Guardian")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer"))]
    //
    //        case .twelve:
    //            return [Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Wolf", image: Image("WolfGameOver")),
    //                    Card(name: "Seer", image: Image("Seer")),
    //                    Card(name: "Guardian", image: Image("Guardian")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer")),
    //                    Card(name: "Farmer", image: Image("Farmer"))]
    //
    //        }
    //    }
    
    
    var body: some View {
        NavigationStack {
            
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
                    
                    NavigationLink(destination: CreateGameView()) {
                        
                        Text("Create a new game")
                            .foregroundColor(.black)
                            .buttonStyle(BorderlessButtonStyle())
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .frame(width: UIScreen.main.bounds.width / 1.10, height: UIScreen.main.bounds.width / 8.50)
                            .background(Color(UIColor(named: "ChevronColor")!))
                            .cornerRadius(12)
                        
                        
                    }
                    
                    NavigationLink(destination: GameView()) {
                        
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
                    
                    Spacer()
                    
                }
            }
        }
//        }.navigationViewStyle(.stack)
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
