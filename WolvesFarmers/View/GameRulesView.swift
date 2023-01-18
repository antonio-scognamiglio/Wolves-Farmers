//
//  GameRulesView.swift
//  WolvesFarmers
//
//  Created by Suyash Lunawat on 18/01/23.
//

import SwiftUI

struct GameRulesView: View {
    var body: some View {
        
           
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        Text("Game Rules")
                            .bold()
                        
                            .foregroundColor(Color.white)
                            .font(.system(size: 36, weight: .regular, design: .rounded))
                        
                        
                        Text("""
The Master (storyteller) manages the game and calls the characters during the nights. All the characters apart from the wolves belong to the village. The Wolves play for themselves.

There are two parties who fight in this game:
The Villagers and The Wolves and the game is divided in two phases, day and night.
""")
                        .padding(30)
                        .bold()
                        
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        Spacer()
                       GameRulesCard(characterImage: "WolfRules", characterName: "Wolf")
                        GameRulesCard(characterImage: "WizardRules", characterName: "Seer")
                        GameRulesCard(characterImage: "GuardianRules", characterName: "Guardian")
                        GameRulesCard(characterImage: "WolfRules", characterName: "Farmer")
                        
                    }
                }
            }
            
            
        
    }
}

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}
