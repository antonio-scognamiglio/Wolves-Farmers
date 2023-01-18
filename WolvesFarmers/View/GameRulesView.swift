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
                Text("Game Rules")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.system(size: 36, weight: .regular, design: .rounded))
                
                ScrollView {
                    Text("\(Text("The Master (storyteller)").bold()) manages the game and calls the characters during the nights. All the characters apart from the wolves belong to the village. The Wolves play for themselves. There are two parties who fight in this game: \n\n\(Text("The Villagers").fontWeight(.bold)) and \(Text("The Wolves").bold()) and the game is divided in two phases, day and night.")
                        .padding(30)
                    
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                    Spacer()
                    // This should be fixed to let each row navigate to the corresponding CardInfoView
                    NavigationLink (destination: CardInfoView()) {
                        GameRulesCard(characterImage: "WolfRules", characterName: "Wolf")
                    }
                    NavigationLink (destination: CardInfoView()) {
                        GameRulesCard(characterImage: "WizardRules", characterName: "Seer")
                    }
                    NavigationLink (destination: CardInfoView()) {
                        GameRulesCard(characterImage: "GuardianRules", characterName: "Guardian")
                    }
                    NavigationLink(destination: CardInfoView()) {
                        GameRulesCard(characterImage: "WolfRules", characterName: "Farmer")}
                    }

                .padding(.top, -30)
            }
        }
        
        
        
    }
}

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}
