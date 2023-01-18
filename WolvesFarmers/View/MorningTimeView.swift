//
//  MorningTimeView.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 18/01/23.
//

import SwiftUI

struct MorningTimeView: View {
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
                Image(systemName: "sun.and.horizon")
                    .foregroundColor(.textYellow)
                    .font(.system(size: 50))
                    .padding(.bottom, 5)
                
                Text("Morning Time")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .bold()
                    .padding(.bottom, 10)
                
                Text("Good morning, the town hall is waiting for you")
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
                
                NavigationLink(destination: NightTimeView()) {
                    BigButtonView(text: "Switch to Night", textColor: .black, backgroundColor: .yellowButton)
                }
                
            }
            .background {
                Color.backgroundColor
                    .ignoresSafeArea()
            }
        }
    }
}

struct MorningTimeView_Previews: PreviewProvider {
    static var previews: some View {
        MorningTimeView()
    }
}
