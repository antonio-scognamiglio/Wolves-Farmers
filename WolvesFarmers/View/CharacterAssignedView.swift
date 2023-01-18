//
//  CharacterAssigned.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 18/01/23.
//

import SwiftUI

struct CharacterAssignedView: View {
    
    @EnvironmentObject var cardModel: CardViewModel
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack(spacing: 30) {
                HeaderView(title: "Character is being assigned", subtitle: "Step 2/3")
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                    Text("Please wait until the master starts the game")
                        .foregroundColor(.white)
                }
                Image("Wolf")
                Spacer()
                
            }
        }
    }
}

struct CharacterAssignedView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterAssignedView()
            .environmentObject(CardViewModel())
    }
}
