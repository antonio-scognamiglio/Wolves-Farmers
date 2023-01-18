//
//  AddNickname.swift
//  WolvesFarmers
//
//  Created by Suyash Lunawat on 17/01/23.
//

import SwiftUI

struct AddNickname: View {
    @State private var username = ""
    @State var gamerSession: GamerMultiPeerSession?
//    @ObservedObject var gamerSession: GamerMultiPeerSession
//    @EnvironmentObject var cardVieModel: CardViewModel
    @State var isNavigation = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack (spacing: 10) {
                    HeaderView(title: "Player’s side:", subtitle: "Set your name").padding(.bottom, 230).padding(.top, -50)
                    
                    CustomTextField(
                        placeholder: Text("Insert your nickname").foregroundColor(.placeholderColor), username: $username)
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.50, height: 2).padding(.bottom, 230)
                    
                    NavigationLink(destination: GameView().environmentObject(gamerSession!), isActive: $isNavigation) {
                        Button(action: {
                            gamerSession = GamerMultiPeerSession(username: username)
                            isNavigation.toggle()
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
          
        }
    }
}


struct AddNickname_Previews: PreviewProvider {
    static var previews: some View {
        AddNickname(gamerSession: .init())
    }
}
