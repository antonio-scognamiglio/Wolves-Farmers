//
//  PlayerGameStarted.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 18/01/23.
//

import SwiftUI

struct PlayerGameStartedView: View {
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
                    
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(.yellow)
                        Text("Tap here to show what your character can do")
                            .foregroundColor(.white)
                    }
                    .frame(width: geo.size.width * 0.95)
                    
                    Image("Wolf")
                        .padding(.bottom)
                    Button {
                        // More actions to come
                    } label: {
                        BigButtonView(text: "Flip Card", textColor: .black, backgroundColor: .yellowButton)
                    }
                }
            }
        }
    }
}

struct PlayerGameStartedView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerGameStartedView()
    }
}
