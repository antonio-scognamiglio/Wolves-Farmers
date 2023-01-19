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
                ZStack {
                    
                    if !isHidden {
                        Image("Moon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                }
                
                if isHidden {
                    cardImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .shadow(radius: 5)
                    Text(cardName)
                        .foregroundColor(.yellowButton)
                        .fontWeight(.bold)
                        .font(.system(size: 38, design: .monospaced))
                }
            }
            
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardImage: Image(""), cardName: "Farmer", isHidden: .constant(true))
    }
}
