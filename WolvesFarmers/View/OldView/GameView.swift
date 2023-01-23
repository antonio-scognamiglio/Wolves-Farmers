//
//  GameView.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 16/01/23.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gamerSession: GamerMultiPeerSession
    @EnvironmentObject var cardModel: CardViewModel
    
    @State var colors: [Color] = [.green, .red, .orange, .blue, .gray].shuffled()
    
    var body: some View {
        VStack(alignment: .center) {
            Text("TRY")
            
            List(gamerSession.connectedPeers, id: \.self) { peer in
               Text(peer.displayName)
                    .foregroundColor(.black)
            }
            ForEach(gamerSession.connectedPeers, id: \.self) { value in
                Rectangle()
                    .fill(colors[gamerSession.connectedPeers.firstIndex(of: value)!])
                    .frame(width: 40, height: 40)
            }
        }.onAppear() {
            assignCard()
        }
        .padding()
    }
    
    public func assignCard() {
        print("OK \(cardModel.username)")
        for x in cardModel.cards {
            print("Print cose\(x.username)")
        }
        cardModel.cards.first(where: {$0.username == cardModel.username})?.image
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gamerSession: .init()).environmentObject(GamerMultiPeerSession(username: "Peppino"))
    }
}
