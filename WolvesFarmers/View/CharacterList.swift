//
//  CharacterList.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 18/01/23.
//

import SwiftUI

struct CharacterList: View {
    let columns = [
        GridItem(.flexible(minimum: 140, maximum: 180)),
        GridItem(.flexible(minimum: 140, maximum: 180))
    ]
    let characters: [String] = ["Wolf", "Seer", "Guardian", "Farmer", "Zorro", "Pepp"]
    var body: some View {
        GeometryReader { geo in
            VStack {
                HeaderView(title: "Step 3/3", subtitle: "Character List")
                ScrollView {
                    LazyVGrid (columns: columns){
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
                Button {
                    withAnimation {
                        // more actions to come
                    }
                } label: {
                    BigButtonView(text: "Start game", textColor: .black, backgroundColor: .yellowButton)
                }
            }
            .background {
                Color.backgroundColor
                    .ignoresSafeArea()
        }
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}
