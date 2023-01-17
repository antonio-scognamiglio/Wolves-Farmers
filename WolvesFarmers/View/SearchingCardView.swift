//
//  SearchingCardView.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

struct SearchingCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(.black, lineWidth: 3)
            .frame(width: UIScreen.main.bounds.width / 1.20, height: UIScreen.main.bounds.height / 2)
            .background {
                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
            }
    }
}

struct SearchingCardView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingCardView()
    }
}
