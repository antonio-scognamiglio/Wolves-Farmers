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
    
    var deck: [Card] {
        
        var cardArray:[Card] = [Card(name: "Wolf", image: Image("WolfGameOver")),
                               Card(name: "Seer", image: Image("Seer")),
                               Card(name: "Guardian", image: Image("Guardian")),
                               Card(name: "Farmer", image: Image("Farmer")),
                               Card(name: "Farmer", image: Image("Farmer")),
                               Card(name: "Farmer", image: Image("Farmer"))]
        
        switch numberOfPlayer {
        
       
        case .seven:
            cardArray.append(Card(name: "Farmer", image: Image("Farmer")))
                   
        case .eight:
            cardArray.append(Card(name: "Farmer", image: Image("Farmer")))
            cardArray.append(Card(name: "Wolf", image: Image("WolfGameOver")))
            
        case .nine:
            return [Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Seer", image: Image("Seer")),
                    Card(name: "Guardian", image: Image("Guardian")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer"))]
            
        case .ten:
            return [Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Seer", image: Image("Seer")),
                    Card(name: "Guardian", image: Image("Guardian")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer"))]
         
        case .eleven:
            return [Card(name: "Wolf",
                         image: Image("WolfGameOver")),
                    Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Seer", image: Image("Seer")),
                    Card(name: "Guardian", image: Image("Guardian")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer"))]
            
        case .twelve:
            return [Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Seer", image: Image("Seer")),
                    Card(name: "Guardian", image: Image("Guardian")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer"))]
        default:
            return [Card(name: "Wolf", image: Image("WolfGameOver")),
                    Card(name: "Seer", image: Image("Seer")),
                    Card(name: "Guardian", image: Image("Guardian")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer")),
                    Card(name: "Farmer", image: Image("Farmer"))]
        
        }
        return cardArray
        
    }
    
//    func resetVotation(at offsets: IndexSet) {
//        offsets.forEach { i in
//            cards[i].votes = 0
//        }
//    }
}
