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
        GridItem(.flexible(minimum: 140, maximum: 180)),
        GridItem(.flexible(minimum: 140, maximum: 180))
    ]
    let characters: [String] = ["Wolf", "Seer", "Guardian", "Farmer", "Zorro", "Pepp"].shuffled()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HeaderView(title: "Step 3/3", subtitle: "Character List")
                ScrollView {
                    LazyVGrid (columns: columns) {
//                        ForEach(characters, id: \.self) { character in
//                            HStack {
//                                Image(systemName: "star.fill")
//                                Spacer()
//                                VStack(alignment: .leading) {
//                                    Text(character)
//                                    Text(character)
//                                        .fontWeight(.semibold)
//                                }
//                                .frame(width: 80, alignment: .leading)
//                            }
//                            .padding()
//                            .background {
//                                RoundedRectangle(cornerRadius: 15)
//                                    .fill(.white)
//                            }
//                            .padding(4)
//                        }
                        ForEach(gamerSession.connectedPeers, id: \.self) { peer in
                            HStack {
                                Image(systemName: "star.fill")
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text(peer.displayName)
                                        .foregroundColor(.black)

                                    Text(characters[gamerSession.connectedPeers.firstIndex(of: peer)!])
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                    
                                }.onAppear {
                                    cardModel.cards.append(Card(name: characters[gamerSession.connectedPeers.firstIndex(of: peer)!], image: Image(systemName: ""), username: peer.displayName, isDeath: false, votes: 0))
                                    print("Cards: \(cardModel.cards)")
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
                
                NavigationLink(destination: NightTimeView(), isActive: $cardModel.isStarted) {
                   Button (action: {
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
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
