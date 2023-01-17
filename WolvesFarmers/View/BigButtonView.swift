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
    
    var backgroundColor: Color
    var body: some View {
        Button {
          // Add Action here
        } label: {
            Text(text)
                .font(.title2)
                .frame(width: UIScreen.main.bounds.width / 1.10, height: UIScreen.main.bounds.height / 12)
                .foregroundColor(textColor)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(backgroundColor)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 5)
                        }
                }
        }
        
    }
}

struct BigButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BigButtonView(text: "Get a random character", textColor: .black, backgroundColor: .white)
    }
}