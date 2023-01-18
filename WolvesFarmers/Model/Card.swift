//
//  Card.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import Foundation
import SwiftUI
import MultipeerConnectivity

struct Card: Identifiable, Equatable {
    let id: UUID?
    var name: String
    var image: Image
    var username: String
    var isDeath: Bool
    var votes: Int
    
//    init() {
//        self.id = UUID.init()
//        self.name = ""
//        self.image = Image(systemName: "")
//        self.username = ""
//        self.isDeath = false
//        self.votation = 0
//    }
    
    init(name: String, image: Image, username: String, isDeath: Bool, votes: Int) {
        self.id = UUID.init()
        self.name = name
        self.image = image
        self.username = username
        self.isDeath = isDeath
        self.votes = votes
    }
    
//    init(name: String, username: MCPeerID) {
//        self.name = name
//        self.username = username
//    }
}
