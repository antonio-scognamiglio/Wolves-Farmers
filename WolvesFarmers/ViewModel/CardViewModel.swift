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
    //if isReborn is 0 you aren't reborn else if is 1 you are reborn 
    @Published var isReborn = 0
    
    @Published var isDied = false
    @Published var nameCard = ""
    
    @Published var endGame = ""
    
    @Published var numberOfPlayer: NumberOfPlayers = .six
    
    
    var deck: [Card] {
        

        var cardArray: [Card] = [Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                               Card(name: "Seer", imageName: "Seer", night: "The seer can ask the master if another character is a wolf."),
                               Card(name: "Guardian", imageName: "Guardian", night: "The guardian can protect one person every night, but he/she can only protect himself once during the game."),
                               Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                               Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                               Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions.")]
        
        switch numberOfPlayer {
        
       
        case .seven:
            cardArray.append(Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."))
                   
        case .eight:
            cardArray.append(Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."))
            cardArray.append(Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."))
            
        case .nine:
            return [Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Seer", imageName: "Seer", night: "The seer can ask the master if another character is a wolf."),
                    Card(name: "Guardian", imageName: "Guardian", night: "The guardian can protect one person every night, but he/she can only protect himself once during the game."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions.")]
            
        case .ten:
            return [Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Seer", imageName: "Seer", night: "The seer can ask the master if another character is a wolf."),
                    Card(name: "Guardian", imageName: "Guardian", night: "The guardian can protect one person every night, but he/she can only protect himself once during the game."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions.")]
         
        case .eleven:
            return [Card(name: "Wolf",
                         imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Seer", imageName: "Seer", night: "The seer can ask the master if another character is a wolf."),
                    Card(name: "Guardian", imageName: "Guardian", night: "The guardian can protect one person every night, but he/she can only protect himself once during the game."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions.")]
            
        case .twelve:
            return [Card(name: "Wolf", imageName:  "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Seer", imageName: "Seer", night: "The seer can ask the master if another character is a wolf."),
                    Card(name: "Guardian", imageName: "Guardian", night: "The guardian can protect one person every night, but he/she can only protect himself once during the game."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions.")]
        default:
            return [Card(name: "Wolf", imageName: "WolfGameOver", mainObjective: "To kill all the villagers.", night: "The wolves choose one person that they want to kill."),
                    Card(name: "Seer", imageName: "Seer", night: "The seer can ask the master if another character is a wolf."),
                    Card(name: "Guardian", imageName: "Guardian", night: "The guardian can protect one person every night, but he/she can only protect himself once during the game."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions."),
                    Card(name: "Farmer", imageName: "Farmer", night: "The farmer doesn't have special actions.")]
        
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
