//
//  CardInfoView.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import SwiftUI

struct CardInfoView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor(named: "Gradient1")!), Color(UIColor(named: "Gradient2")!)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color(UIColor(named: "ChevronColor")!))
                            .bold()
                    }
                    Image("Wolf")
                        .padding(.horizontal)
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color(UIColor(named: "ChevronColor")!))
                            .bold()
                    }
                }.padding(.horizontal)
                    .padding(.vertical)
                    
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color(UIColor(named: "DarkBlue")!))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.80)
                        .padding(.bottom, -50)
                    VStack (spacing: 30) {
                        VStack (spacing: 7) {
                            Text("Main Objective")
                                .foregroundColor(Color(UIColor(named: "YellowText")!))
                            Text("To kill everyone in the game")
                                .foregroundColor(Color(.white))
                        }
                        VStack (spacing: 7) {
                            HStack {
                                Image(systemName: "sun.and.horizon")
                                Text("During Day")
                            }.foregroundColor(Color(UIColor(named: "YellowText")!))
                            Text("Try to act like you are not guilty")
                                .foregroundColor(Color(.white))
                        }
                        VStack (spacing: 7) {
                            HStack {
                                Image(systemName: "moon.fill")
                                Text("During Night")
                            }.foregroundColor(Color(UIColor(named: "YellowText")!))
                            Text("To kill everyone in the game")
                                .foregroundColor(Color(.white))
                        }
                    }.padding(.top)
                }
            }
            
        }
    }
}

struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView()
    }
}
