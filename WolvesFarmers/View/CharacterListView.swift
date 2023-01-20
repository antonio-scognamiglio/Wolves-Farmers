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
    
    let columns = [
        GridItem(.flexible(minimum: 140, maximum: 180)),
        GridItem(.flexible(minimum: 140, maximum: 180))
    ]
    
    //    let characters: [String] = ["Wolf", "Seer", "Guardian", "Farmer", "Zorro", "Pepp"].shuffled()
    
    var body: some View {
        
        VStack {
            HeaderView(title: "Step 3/3", subtitle: "Character List")
            ScrollView {
                LazyVGrid (columns: columns) {
                    ForEach(gamerSession.connectedPeers, id: \.self) { peer in
                        HStack {
                            if !setCards.isEmpty {
                                setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].image.resizable().frame(width: 50,height: 50)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text(peer.displayName)
                                    .foregroundColor(.black)
                                if !setCards.isEmpty {
                                    Text(setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                }
                            }
                            .onAppear {
                                cardModel.cards.append(Card(name: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name, imageName: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].imageName , username: peer.displayName, isDeath: false))
                                
//                                let tupla = gamerSession.send(card: Card(name: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name, imageName: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].imageName , username: peer.displayName, isDeath: false), username: peer.displayName, isMaster: true)
                                
//                                cardModel.isMaster = tupla.0
//
//                                cardModel.cardReceived = tupla.1

                                //                                    cardModel.cards.append(Card(name: characters[gamerSession.connectedPeers.firstIndex(of: peer)!], image: Image(""), username: peer.displayName, isDeath: false ))

                                //                                    print("Cards: \(cardModel.cards)")
                            }
                            .frame(width: 80, alignment: .leading)
                        }
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
            
            NavigationLink(destination: DayNightView(setCards: $setCards), isActive: $cardModel.isStarted) {
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
