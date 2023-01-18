//
//  NightTimeView.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 18/01/23.
//

import SwiftUI

struct NightTimeView: View {
    @EnvironmentObject var gamerSession: GamerMultiPeerSession
    @EnvironmentObject var cardModel: CardViewModel
    
    let columns = [
        GridItem(.flexible(minimum: 140, maximum: 180)),
        GridItem(.flexible(minimum: 140, maximum: 180))
    ]
    let characters: [String] = ["Wolf", "Seer", "Guardian", "Farmer", "Zorro", "Pepp"]
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(systemName: "moon.fill")
                    .foregroundColor(.textYellow)
                    .font(.system(size: 50))
                    .padding(.bottom, 5)
                
                Text("Night Time")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .bold()
                    .padding(.bottom, 10)
                
                Text("The night is coming, you might not survive.. ")
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width / 1.30)
                    .foregroundColor(.textYellow)
                    .font(.system(size: 18))
                
                
                ScrollView {
                    LazyVGrid (columns: columns) {
                        ForEach(characters, id: \.self) { character in
                            HStack {
                                Image(systemName: "star.fill")
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text(character)
                                    Text(character)
                                        .fontWeight(.semibold)
                                }
                                .frame(width: 80, alignment: .leading)
                            }
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.white)
                            }
                            .padding(4)
                        }
                    }
                    .padding()
                }
                .scrollDisabled(true)
                
                NavigationLink(destination: MorningTimeView()) {
                    BigButtonView(text: "Switch to Morning", textColor: .black, backgroundColor: .yellowButton)
                }
                
            }
            .background {
                Color.backgroundColorDark
                    .ignoresSafeArea()
            }
        }
    }
}

struct NightTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NightTimeView()
    }
}
