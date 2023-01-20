//
//  FrontCardView.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 19/01/23.
//

import SwiftUI

struct CardView: View {
    @State var cardImage: Image
    @State var cardName: String
    @Binding var isHidden: Bool
    @EnvironmentObject var cardModel: CardViewModel
    @EnvironmentObject var gamerSession: GamerMultiPeerSession
  
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.cardColorGradient)
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 13)
                }
                .frame(height: UIScreen.main.bounds.height * 0.45)
                .padding()
            VStack {
                    if !isHidden {
                        Image("Moon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        Text("")
                            .foregroundColor(.yellowButton)
                            .fontWeight(.bold)
                            .font(.system(size: 38, design: .monospaced))
                    } else {
                        
                        //                    cardImage
                       
                        findIndex().image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                                .shadow(radius: 5)
                            Text(findIndex().name)
                                .foregroundColor(.yellowButton)
                                .fontWeight(.bold)
                                .font(.system(size: 38, design: .monospaced))
                        }
                    }
            }
            
            
        }
    func findIndex() -> Card {
        var card: Card
        
        
        
//        for peer in gamerSession.connectedPeers {
//            card = cardModel.setCards[gamerSession.connectedPeers.firstIndex(of: peer)!]
       
//        card = cardModel.setCards.first(where: {$0.username == cardModel.username}) ?? cardModel.deck.first!
        card = cardModel.setCards.first(where: {$0.username == gamerSession.myPeerId.displayName}) ?? cardModel.deck.first!
        print("*********Confronto**************")
        print(cardModel.username)
        print(card.username)
//    }
       return card
}
    }
    
  

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(cardImage: Image(""), cardName: "Farmer", isHidden: .constant(true))
//            .environmentObject(CardViewModel())
//    }
//}
