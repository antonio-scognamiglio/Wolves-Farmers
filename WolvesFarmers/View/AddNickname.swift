//
//  AddNickname.swift
//  WolvesFarmers
//
//  Created by Suyash Lunawat on 17/01/23.
//

import SwiftUI

struct AddNickname: View {
    @State private var username = ""
    @State private var multipeerSession: GamerMultiPeerSession?
    @ObservedObject var gamerSession: GamerMultiPeerSession
    @State private var currentView = 0
    
    var body: some View {
        
        if currentView == 0 {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack (spacing: 10) {
                    HeaderView(title: "Player’s side:", subtitle: "Set your name").padding(.bottom, 230).padding(.top, -50)
                    
                    CustomTextField(
                        placeholder: Text("Insert your nickname").foregroundColor(.placeholderColor), username: $username)
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.50, height: 2).padding(.bottom, 230)
                    
                    Button(action: {
                        multipeerSession = GamerMultiPeerSession(username: username)
                        currentView = 1
                    }) {
                        Text("Confirm name")
                            .foregroundColor(.black)
                    }.buttonStyle(BorderlessButtonStyle())
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                        .frame(width: UIScreen.main.bounds.width / 1.10, height: UIScreen.main.bounds.width / 8.50)
                        .background(Color(UIColor(named: "ChevronColor")!))
                        .cornerRadius(12)
                        .disabled(username.isEmpty ? true : false)
                }
            }
            
        }
        else if currentView == 1 {
            GameView(gamerSession: gamerSession)
        }

    }
    
}


struct AddNickname_Previews: PreviewProvider {
    static var previews: some View {
        AddNickname(gamerSession: .init())
    }
}
