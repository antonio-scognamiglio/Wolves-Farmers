//
//  FirstView.swift
//  WolvesFarmers
//
//  Created by Suyash Lunawat on 18/01/23.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        ZStack{
            Color.backgroundColor
                .ignoresSafeArea()
            VStack{
                Spacer()
                Button{}
            label:{
                Text("How to Play?")
                    .foregroundColor(Color.yellowButton)
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 8.50)
                    .background(Color(UIColor(named: "1E1F24Color")!))
                    .cornerRadius(30)
            }
                Image("wolfIcon")
                
                Spacer()
                
                Button{ }
//                the action is yet to be assigned to the button
            label:{
                Text("Create a new game")
                    .foregroundColor(.black)
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .frame(width: UIScreen.main.bounds.width / 1.10, height: UIScreen.main.bounds.width / 8.50)
                    .background(Color(UIColor(named: "ChevronColor")!))
                    .cornerRadius(12)
            }
              
                Button {}
            label: {
                Text("Join a game")
                    .foregroundColor(Color.yellowButton)
                    
//                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .frame(width: UIScreen.main.bounds.width / 1.10, height: UIScreen.main.bounds.width / 8.50)
                    .background(Color.backgroundColor)
                    .cornerRadius(12)
                    .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.yellowButton, lineWidth: 1)
                            )
            }
                Spacer()

            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
