//
//  GameView.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 16/01/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gamerSession: GamerMultiPeerSession
    @State var colors: [Color] = [.green, .red, .orange, .blue, .gray].shuffled()
    
    var body: some View {
        VStack(alignment: .center) {
            Text("TRY")
            Spacer()
            ForEach(gamerSession.connectedPeers, id: \.self) { value in
                Rectangle()
                    .fill(colors[gamerSession.connectedPeers.firstIndex(of: value)!])
                    .frame(width: 300, height: 300)
            }
        }
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gamerSession: .init())
    }
}
