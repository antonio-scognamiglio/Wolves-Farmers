//
//  SearchingPlayersView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct SearchingPlayersView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                HeaderView(title: "Storyteller", subtitle: "Searching for players...")
                    .padding(.bottom, 100)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.width / 1.20, height: UIScreen.main.bounds.height / 2)
                
            }
            
        }
    }
}

struct SearchingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayersView()
    }
}
