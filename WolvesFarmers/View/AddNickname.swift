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
            VStack {
                Text("Enter nickname below")
                TextField("Nickname",text: $username)
                    .padding()
                
                Button("Continue →") {
                    multipeerSession = GamerMultiPeerSession(username: username)
                    currentView = 1
                    
                    
                }.buttonStyle(BorderlessButtonStyle())
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    .disabled(username.isEmpty ? true : false)
            }
            
        }
        else if currentView == 1 {
            GameView(gamerSession: gamerSession)
        }


    }
    
}


//struct AddNickname_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNickname()
//    }
//}
