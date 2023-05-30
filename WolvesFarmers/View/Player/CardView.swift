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
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.cardColorGradient)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 13)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.75)
                    .aspectRatio( 2/3, contentMode: .fit)
                    .padding()
                    .padding(.top)
                VStack {
                        if isHidden {
                            Image("Moon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230)
                            Text("")
                                .foregroundColor(.yellowButton)
                                .fontWeight(.bold)
                                .font(.system(size: 38, design: .monospaced))
                        } else {
                        cardImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 230)
                            .shadow(radius: 5)
                        Text(cardName)
                            .foregroundColor(.yellowButton)
                            .fontWeight(.bold)
                            .font(.system(size: 38, design: .monospaced))
                    }
                }
                .frame(height: geo.size.height * 0.57)
                .overlay {
                    if (cardModel.isDied && cardModel.isReborn == 0) {
                        Image(systemName: "xmark")
                        .resizable()
//                        .padding(30)
                        .fontWeight(.thin)
                        .foregroundColor(.red).opacity(0.9)
                    }
                }
//                .frame(height: geo.size.height * 0.57)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardImage: Image("Farmer"), cardName: "Farmer", isHidden: .constant(false))
            .environmentObject(CardViewModel())
    }
}
