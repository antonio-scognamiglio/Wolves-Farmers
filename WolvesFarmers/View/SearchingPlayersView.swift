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
                
                
                List {
                    ForEach(1..<6) { i in
                        Text("iPhone \(i)")
                    }
                }
                .padding(.horizontal)
                .listStyle(GroupedListStyle())
                .scrollContentBackground(.hidden)
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.width / 1.20, height: UIScreen.main.bounds.height / 2)
                .background {
                    SearchingCardView()
                }
                
                Button {
                    // Action
                } label: {
                    BigButtonView(text: "Get a random character", textColor: .black, backgroundColor: .white)
                        .padding(.vertical)
                }
               
            }
        }
    }
}

struct SearchingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayersView()
    }
}
