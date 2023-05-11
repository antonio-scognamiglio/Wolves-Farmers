//
//  DayNightView.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 20/01/23.
//

import SwiftUI

struct DayNightView: View {
    @EnvironmentObject var gamerSession: GamerMultiPeerSession
    @EnvironmentObject var cardModel: CardViewModel
    @Binding var setCards: [Card]
    @State var isDay = true
    
    let columns = [
        GridItem(.flexible(minimum: 140, maximum: 180)),
        GridItem(.flexible(minimum: 140, maximum: 180))
    ]
    let characters: [String] = ["Wolf", "Seer", "Guardian", "Farmer", "Zorro", "Pepp"]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if isDay {
                    Color.backgroundColor
                        .ignoresSafeArea()
                } else {
                    Color.backgroundColorDark
                        .ignoresSafeArea()
                }
                
                VStack {
                    // Day
                    if isDay {
                        Image(systemName: "sun.and.horizon")
                            .foregroundColor(.textYellow)
                            .font(.system(size: 50))
                            .padding(.bottom, 5)
                        
                        Text("Morning Time")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .bold()
                            .padding(.bottom, 10)
                        
                        Text("Good morning, the town hall is waiting for you")
                            .multilineTextAlignment(.center)
                            .frame(width: UIScreen.main.bounds.width / 1.30)
                            .foregroundColor(.textYellow)
                            .font(.system(size: 18))
                    } else
                    // Night
                    {
                        Image(systemName: "moon.fill")
                            .foregroundColor(.textYellow)
                            .font(.system(size: 41))
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
                    }
                    
                    
                    ScrollView {
                        ForEach(gamerSession.connectedPeers, id: \.self) { peer in
                            
                            Button(action: {
                                setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].isDeath.toggle()
                                print("SO MORTO \(setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].isDeath)")
                                if (setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].isDeath) {
                                    cardModel.isDied = gamerSession.send(cards: cardModel.cards, isDied: true, isReborn: 0, username: peer.displayName, isEnded: "").0
                                } else {
                                    cardModel.isReborn = gamerSession.send(cards: cardModel.cards, isDied: false, isReborn: 1, username: peer.displayName, isEnded: "").2
                                }
                                
                            }, label: {
                                HStack {
                                    if !setCards.isEmpty {
                                        setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].image.resizable().frame(width: 50,height: 50)
                                            .padding(.trailing, 20)
                                            .overlay {
                                                if (setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].isDeath) {
                                                    Image(systemName: "xmark")
                                                        .foregroundColor(.red)
                                                        .font(.system(size: 80))
                                                    
                                                }
                                            }
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
                                    .padding(.horizontal, 30)
                                    .onAppear {
                                        cardModel.cards.append(Card(name: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].name, imageName: setCards[gamerSession.connectedPeers.firstIndex(of: peer)!].imageName , username: peer.displayName, isDeath: false))
                                    }
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.white)
                                }
                            })
                            .frame(width: UIScreen.main.bounds.width / 1.13 , height: UIScreen.main.bounds.height / 8.5 )
                            
                        }
                    }
                    .padding()
                    
                    Button {
                        isDay.toggle()
                    } label: {
                        BigButtonView(text: isDay ? "Switch to Night" : "Switch to Day", textColor: .black, backgroundColor: .yellowButton)
                            .padding()
                    }
                    
                    Button(action: {
                        cardModel.endGame = gamerSession.send(cards: cardModel.cards, isDied: false, isReborn: 0, username: "", isEnded: "END").3
                        cardModel.reset()
                        NavigationUtil.popToRootView()
                    }, label: {
                        BigButtonView(text: "End the Game", textColor: .red, borderColor: .red, backgroundColor: .clear)
                            .opacity(isDay ? 1 : 0)
                            .disabled(!isDay)
                            .animation(.linear, value: isDay)
                            .padding(.bottom, 10)
                    })
                    
                    
                }
                .navigationBarBackButtonHidden()
                .animation(.linear(duration: 0.7), value: isDay)
            }
        }.onAppear {
            print("CARDDD: \(cardModel.cards)")
            cardModel.cards = gamerSession.send(cards: cardModel.cards, isDied: false, isReborn: 0, username: "", isEnded: "").1
        }
    }
    
}

struct DayNightView_Previews: PreviewProvider {
    static var previews: some View {
        DayNightView(setCards: .constant([Card(name: "Wolf", imageName: "WolfGameOver"),
                                          Card(name: "Seer", imageName: "Seer"),
                                          Card(name: "Guardian", imageName: "Guardian"),
                                          Card(name: "Farmer", imageName: "Farmer"),
                                          Card(name: "Farmer", imageName: "Farmer"),
                                          Card(name: "Farmer", imageName: "Farmer")]))
        .environmentObject(GamerMultiPeerSession())
        .environmentObject(CardViewModel())
    }
}
