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
    // Qui bisogna collegare il model e far vedere solo la carta assegnata allo specifico device
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
            card = cardModel.cards.first(where: {$0.username == cardModel.username}) ?? cardModel.cards[0]
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
