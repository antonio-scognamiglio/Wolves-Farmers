//
//  BigButtonView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct BigButtonView: View {
    var text: String
    var textColor: Color
    var borderColor: Color = .black
    
    var backgroundColor: Color
    var body: some View {
        
        Text(text)
            .font(.title2)
            .frame(width: UIScreen.main.bounds.width / 1.10, height: UIScreen.main.bounds.width / 8.50)
            .foregroundColor(textColor)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(backgroundColor)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(borderColor, lineWidth: 1)
                    }
            }
    }
}

struct BigButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BigButtonView(text: "Get a random character", textColor: .black, backgroundColor: .white)
    }
}
