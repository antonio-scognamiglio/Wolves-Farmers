//
//  EndGameView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 18/01/23.
//

import SwiftUI

struct EndGameView: View {
    
    var haveWolvesWon = true
    
    var body: some View {
        ZStack {
            Color.textBackgroundColor
                .ignoresSafeArea()
            VStack {
                Text("Game Over")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                
                Text(haveWolvesWon ? "The wolves won!" : "The village won!")
                    .foregroundColor(.white)
                
                Image(haveWolvesWon ? "WolfGameOver" : "")
                
                Button {
                    
                } label: {
                    BigButtonView(text: "Back to menu", textColor: .black, backgroundColor: .yellowButton)
                }
                .padding()
                
                Button {
                    
                } label: {
                    BigButtonView(text: "Play Again", textColor: .yellowButton, borderColor: .yellowButton, backgroundColor: .textBackgroundColor)
                        
                }
            }
        }
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
