//
//  GameRulesCard.swift
//  WolvesFarmers
//
//  Created by Suyash Lunawat on 18/01/23.
//

import SwiftUI

struct GameRulesCard: View {
    
    @State var characterImage : String
     @State var characterName : String
    var body: some View {
        
        
        HStack {
            
            Image(characterImage)
                .padding()
            Text(characterName)
                .font(.title).bold()
                .fixedSize()
                .padding(.trailing, 50)
           Spacer()
        }
        .frame(width: UIScreen.main.bounds.width / 1.20, height:UIScreen.main.bounds.width / 5.20)
        .background {
            RoundedRectangle(cornerRadius: 20)
            
                .strokeBorder(.black, lineWidth: 3)
                .background(
                    RoundedRectangle(cornerRadius: 20).fill(.white)
                       
                )
        }
    }
}

struct GameRulesCard_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesCard(characterImage: "WolfRules", characterName: "Wolf")
    }
}
