//
//  NightTimeView.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 18/01/23.
//

import SwiftUI

struct NightTimeView: View {
    @EnvironmentObject var gamerSession: GamerMultiPeerSession
    @EnvironmentObject var cardModel: CardViewModel
    @Binding var setCards: [Card]
    
    let columns = [
        GridItem(.flexible(minimum: 140, maximum: 180)),
        GridItem(.flexible(minimum: 140, maximum: 180))
    ]
    let characters: [String] = ["Wolf", "Seer", "Guardian", "Farmer", "Zorro", "Pepp"]
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(systemName: "moon.fill")
                    .foregroundColor(.textYellow)
                    .font(.system(size: 50))
                    .padding(.bottom, 5)
                
                Text("Night Time")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .bold()
                    .padding(.bottom, 10)
                
                Text("The night is coming, you might not survive.. ")
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width / 1.30)
                    .foregroundColor(.textYellow)
                    .font(.system(size: 18))
                
                
                ScrollView {
                    LazyVGrid (columns: columns) {
                        ForEach(gamerSession.connectedPeers, id: \.self) { peer in
                            
                            Button(action: {
                                setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].isDeath.toggle()
                            }, label: {
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
                                        
                                        //                                    cardModel.cards.append(Card(name: characters[gamerSession.connectedPeers.firstIndex(of: peer)!], image: Image(""), username: peer.displayName, isDeath: false ))
                                        
                                        //                                    print("Cards: \(cardModel.cards)")
                                    }
                                    .frame(width: 80, alignment: .leading)
                                }
                                .overlay {
                                    if (setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].isDeath) {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.red)
                                            .font(.system(size: 100))
                                    }
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.white)
                                }
                                .padding(4)
                            })
                            
                            
                        }
                    }
                    .padding()
                }
                .scrollDisabled(true)
                
                NavigationLink(destination: MorningTimeView(setCards: $setCards)) {
                    BigButtonView(text: "Switch to Morning", textColor: .black, backgroundColor: .yellowButton)
                }
                
            }
            .background {
                Color.backgroundColorDark
                    .ignoresSafeArea()
            }
        }.onAppear {
            print("CARDDD: \(cardModel.cards)")
            //            let tupla = gamerSession.send(cards: cardModel.cards, isMaster: false)
            //            cardModel.isMaster = gamerSession.send(cards: cardModel.cards, isMaster: true).0
            cardModel.cards = gamerSession.send(cards: cardModel.cards, isDied: false, isReborn: 0, username: "", isEnded: "").1
        }
    }
}

struct NightTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NightTimeView(setCards: .constant([
            Card(name: "Wolf", imageName: "WolfGameOver"),
            Card(name: "Seer", imageName: "Seer"),
            Card(name: "Guardian", imageName: "Guardian"),
            Card(name: "Farmer", imageName: "Farmer"),
            Card(name: "Farmer", imageName: "Farmer"),
            Card(name: "Farmer", imageName: "Farmer")]))
        .environmentObject(GamerMultiPeerSession())
        .environmentObject(CardViewModel())
    }
}
