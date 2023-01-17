//
//  PickSideView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct PickSideView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    HeaderView(title: "Create a new game", subtitle: "Pick your role")
                        .padding(.bottom, 100)
                    Group {
                        
                        NavigationLink { SearchingPlayersView() } label: {
                            RoleCardView(role: "Storyteller", imageName: "Storyteller")
                                .foregroundColor(.black)
                        }
                        NavigationLink { Text("PlayerView") } label: {
                            RoleCardView(role: "Player", imageName: "Players")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct PickSideView_Previews: PreviewProvider {
    static var previews: some View {
        PickSideView()
    }
}
