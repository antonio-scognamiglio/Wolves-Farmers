//
//  CardViewModel.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import Foundation
import SwiftUI
import MultipeerConnectivity

class CardViewModel: ObservableObject {
    @Published var cards = [Card]()
    @Published var users = [String]()
    
    @Published var username = ""
    @Published var isMaster = false
    @Published var isStarted = false
    @Published var isPlayer = false
    @Published var nameCard = ""
    
    @Published var numberOfPlayer: NumberOfPlayers = .six
    
    @Published var setCards = [Card]()
    
    var deck: [Card] {
        
        var cardArray:[Card] = [Card(name: "Wolf", imageName: "WolfGameOver"),
                               Card(name: "Seer", imageName: "Seer"),
                               Card(name: "Guardian", imageName: "Guardian"),
                               Card(name: "Farmer", imageName: "Farmer"),
                               Card(name: "Farmer", imageName: "Farmer"),
                               Card(name: "Farmer", imageName: "Farmer")]
        
        switch numberOfPlayer {
        
       
        case .seven:
            cardArray.append(Card(name: "Farmer", imageName: "Farmer"))
                   
        case .eight:
            cardArray.append(Card(name: "Farmer", imageName: "Farmer"))
            cardArray.append(Card(name: "Wolf", imageName: "WolfGameOver"))
            
        case .nine:
            return [Card(name: "Wolf", imageName: "WolfGameOver"),
                    Card(name: "Wolf", imageName: "WolfGameOver"),
                    Card(name: "Seer", imageName: "Seer"),
                    Card(name: "Guardian", imageName: "Guardian"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer")]
            
        case .ten:
            return [Card(name: "Wolf", imageName: "WolfGameOver"),
                    Card(name: "Wolf", imageName: "WolfGameOver"),
                    Card(name: "Seer", imageName: "Seer"),
                    Card(name: "Guardian", imageName: "Guardian"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer")]
         
        case .eleven:
            return [Card(name: "Wolf",
                         imageName: "WolfGameOver"),
                    Card(name: "Wolf", imageName: "WolfGameOver"),
                    Card(name: "Seer", imageName: "Seer"),
                    Card(name: "Guardian", imageName: "Guardian"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer")]
            
        case .twelve:
            return [Card(name: "Wolf", imageName:  "WolfGameOver"),
                    Card(name: "Wolf", imageName: "WolfGameOver"),
                    Card(name: "Wolf", imageName: "WolfGameOver"),
                    Card(name: "Seer", imageName: "Seer"),
                    Card(name: "Guardian", imageName: "Guardian"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer")]
        default:
            return [Card(name: "Wolf", imageName: "WolfGameOver"),
                    Card(name: "Seer", imageName: "Seer"),
                    Card(name: "Guardian", imageName: "Guardian"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer"),
                    Card(name: "Farmer", imageName: "Farmer")]
        
        }
        return cardArray
        
    }
    
    func decoded(cards: [Card]) {
        DispatchQueue.main.async {
            self.cards = cards
        }
        
    }
    
    func reset () {
        DispatchQueue.main.async {
            self.cards.removeAll()
        }
    }
    
//    func resetVotation(at offsets: IndexSet) {
//        offsets.forEach { i in
//            cards[i].votes = 0
//        }
//    }
}
