//
//  CharacterList.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 18/01/23.
//

import SwiftUI

struct CharacterListView: View {
    @EnvironmentObject var gamerSession: GamerMultiPeerSession
    @EnvironmentObject var cardModel: CardViewModel
    @State var setCards = [Card]()
    
    
    //    let characters: [String] = ["Wolf", "Seer", "Guardian", "Farmer", "Zorro", "Pepp"].shuffled()
    
    var body: some View {
        
        VStack {
            HeaderView(title: "Step 3/3", subtitle: "Character List")
                .padding(.vertical)
            
            ScrollView {
                ForEach(gamerSession.connectedPeers, id: \.self) { peer in
                    HStack {
                        if !setCards.isEmpty {
                            setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].image.resizable().frame(width: 50, height: 50, alignment: .leading)
                                .padding(.leading)
                                .padding(.trailing, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(peer.displayName)
                                .foregroundColor(.black)
                            
                            if !setCards.isEmpty {
                                Text(setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                        .onAppear {
                            cardModel.cards.append(Card(name: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name, imageName: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].imageName , username: peer.displayName, isDeath: false))
                            
                        }
                    }
                 
                    .frame(width: UIScreen.main.bounds.width / 1.13 , height: UIScreen.main.bounds.height / 8.5 )
                    .background {
                        RoundedRectangle(cornerRadius: 20).fill(Color.white)
                    }
                }
            }
            .padding()
            NavigationLink(destination: DayNightView(setCards: $setCards), isActive: $cardModel.isStarted) {
                Button (action: {
                    cardModel.isStarted.toggle()
                }, label: {
                    BigButtonView(text: "Start game", textColor: .black, backgroundColor: .yellowButton)
                        .padding(.bottom, 10)
                })
                
            }
            
        }
        .background {
            Color.backgroundColor
                .ignoresSafeArea()
        }
        
        .onAppear {
            
            for value in NumberOfPlayers.allCases {
                cardModel.numberOfPlayer = value
                setCards = cardModel.deck.shuffled()
                
            }
            
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
            .environmentObject(GamerMultiPeerSession())
            .environmentObject(CardViewModel())
    }
}
