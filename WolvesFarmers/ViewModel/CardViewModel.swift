//
//  CardViewModel.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var cards = [Card]()
    
    @Published var username = ""
    
    func resetVotation(at offsets: IndexSet) {
        offsets.forEach { i in
            cards[i].votes = 0
        }
    }
}
