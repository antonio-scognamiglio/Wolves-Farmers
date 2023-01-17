//
//  RoleCardView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct RoleCardView: View {
    var role: String
    var imageName: String
    var body: some View {
        HStack {
            Image(imageName)
            Spacer()
            Text(role)
                .font(.title).bold()
                .fixedSize()
                .padding(.trailing, 50)
            
        }
        .frame(width: UIScreen.main.bounds.width / 1.20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(.black, lineWidth: 3)
                .background(
                    RoundedRectangle(cornerRadius: 20).fill(.white)
                
                )
        }
        
    }
}

struct RoleCardView_Previews: PreviewProvider {
    static var previews: some View {
        RoleCardView(role: "Storyteller", imageName: "Storyteller")
    }
}
