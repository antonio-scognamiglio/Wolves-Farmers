//
//  CardViewModel.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import Foundation
import MultipeerConnectivity

class CardViewModel: ObservableObject {
    @Published var cards = [Card]()
    @Published var users = [String]()
    
    @Published var username = ""
    @Published var isStarted = false
    @Published var nameCard = ""
    
//    func resetVotation(at offsets: IndexSet) {
//        offsets.forEach { i in
//            cards[i].votes = 0
//        }
//    }
}
