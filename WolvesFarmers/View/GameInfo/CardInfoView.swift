//
//  CardInfoView.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import SwiftUI

struct CardInfoView: View {
    var card: Card
    
    var body: some View {
        
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Spacer()
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
//                    .padding(.horizontal)
                    .padding(.bottom, 30)
                
                
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color(UIColor(named: "DarkBlue")!))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.80)
                        .padding(.bottom, -40)
                    
                    VStack (spacing: 30) {
                        VStack (spacing: 7) {
                            Text("Main Objective")
                                .foregroundColor(Color(UIColor(named: "YellowText")!))
                            Text(card.mainObjective)
                                .foregroundColor(Color(.white))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        VStack (spacing: 7) {
                            HStack {
                                Image(systemName: "sun.and.horizon")
                                Text("During Day")
                            }.foregroundColor(Color(UIColor(named: "YellowText")!))
                            Text(card.day)
                                .foregroundColor(Color(.white))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        VStack (spacing: 7) {
                            HStack {
                                Image(systemName: "moon.fill")
                                Text("During Night")
                            }.foregroundColor(Color(UIColor(named: "YellowText")!))
                            Text(card.night)
                                .foregroundColor(Color(.white))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
            }
            
        }
    }
}

struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView(card: Card(name: "Guardian", imageName: "Guardian", night: "The guardian can protect one person every night, but he can only protect himself once during the game."))
    }
}
