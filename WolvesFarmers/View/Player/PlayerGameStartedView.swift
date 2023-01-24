//
//  PlayerGameStarted.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 18/01/23.
//

import SwiftUI

struct PlayerGameStartedView: View {
    @EnvironmentObject var cardModel: CardViewModel
    @EnvironmentObject var gameModel: GamerMultiPeerSession
    @State var isFlipped = false
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Color.textBackgroundColor
                    .ignoresSafeArea()
                VStack {
                    Group {
                        Text("Game has started")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 2)
                        Text("Please pay attention to the master")
                            .padding(.bottom, 25)
                    }
                    .foregroundColor(.white)
                    
//                    HStack {
//                        Image(systemName: "questionmark.circle")
//                            .foregroundColor(.yellow)
//                        Text("Tap here to show what your character can do")
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: geo.size.width * 0.95)
                    
                    CardView(cardImage: showCard().image , cardName: showCard().name, isHidden: $isFlipped)
                    Button {
//                        print ("Is master: \(cardModel.isMaster)")
//                        if cardModel.isMaster {
                        isFlipped.toggle()
//                        }
                        // More actions to come
                    } label: {
                        BigButtonView(text: "Flip Card", textColor: .black, backgroundColor: .yellowButton)
                            .padding()
                    }
                    
                    if (cardModel.isDied && cardModel.isReborn == 0) {
                        Text("SO MORTO").font(.title).foregroundColor(.red)
                    }
                    
                }
            }
        }.onAppear() {
            print("Provo CARD: \(cardModel.isDied)")
        }
    }
    public func showCard() -> Card {
        print("CARDMODEL: \(cardModel.cards)")
        return cardModel.cards.first(where: {$0.username == cardModel.username}) ?? Card(name: "", imageName: "")
    }
      
}

struct PlayerGameStartedView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerGameStartedView()
            .environmentObject(GamerMultiPeerSession())
            .environmentObject(CardViewModel())
    }
}
