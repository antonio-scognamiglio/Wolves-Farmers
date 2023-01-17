//
//  HeaderView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            Text(title)
//            Text("Create a new game")
                .font(.subheadline)
//            Text("Pick your role")
            Text(subtitle)
                .font(.title2).bold()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background {
          Rectangle()
                .fill(Color.textBackgroundColor)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Create a new game", subtitle: "Pick your role")
    }
}
