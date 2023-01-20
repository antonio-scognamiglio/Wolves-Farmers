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
    
    let columns = [
        GridItem(.fixed(180)),
        GridItem(.fixed(180))
    ]
    
    //    let characters: [String] = ["Wolf", "Seer", "Guardian", "Farmer", "Zorro", "Pepp"].shuffled()
    
    var body: some View {
        
        VStack {
            HeaderView(title: "Step 3/3", subtitle: "Character List")
            ScrollView {
                LazyVGrid (columns: columns) {
                    ForEach(gamerSession.connectedPeers, id: \.self) { peer in
                        HStack {
                            if !cardModel.setCards.isEmpty {
                                cardModel.setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].image.resizable().frame(width: 50,height: 50)
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 3) {
                                Text(peer.displayName)
                                    .foregroundColor(.black)
                                    
                                if !cardModel.setCards.isEmpty {
                                    Text(cardModel.setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                }
                            }
                            .onAppear {
                                cardModel.cards.append(Card(name: cardModel.setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name, imageName: cardModel.setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].imageName , username: peer.displayName, isDeath: false))
                                
//                                let tupla = gamerSession.send(card: Card(name: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name, imageName: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].imageName , username: peer.displayName, isDeath: false), username: peer.displayName, isMaster: true)
                                
//                                cardModel.isMaster = tupla.0
//
//                                cardModel.cardReceived = tupla.1

                                //                                    cardModel.cards.append(Card(name: characters[gamerSession.connectedPeers.firstIndex(of: peer)!], image: Image(""), username: peer.displayName, isDeath: false ))

                                //                                    print("Cards: \(cardModel.cards)")
                            }
//                            .frame(width: 80, alignment: .leading)
                        }
                        .frame(height: 100)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                        }
                        .padding(4)
                    }
                }
                .padding()
            }
            .scrollDisabled(true)
            
            NavigationLink(destination: DayNightView(), isActive: $cardModel.isStarted) {
                Button (action: {
//                    cardModel.isMaster = gamerSession.send(isMaster: true)
                    cardModel.isStarted.toggle()
                }, label: {
                    BigButtonView(text: "Start game", textColor: .black, backgroundColor: .yellowButton)
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
                cardModel.setCards = cardModel.deck.shuffled()
                
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
