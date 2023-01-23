//
//  PickSideView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct PickSideView: View {
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                HeaderView(title: "Create a new game", subtitle: "Pick your role")
                    .padding(.bottom, 100)
                Group {
                    RoleCardView(role: "Storyteller", imageName: "Storyteller")
                    RoleCardView(role: "Player", imageName: "Players")
                }
                .padding()
            }
        }
    }
}

struct PickSideView_Previews: PreviewProvider {
    static var previews: some View {
        PickSideView()
    }
}
