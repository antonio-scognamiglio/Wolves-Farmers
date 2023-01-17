//
//  Card.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import Foundation
import SwiftUI
import MultipeerConnectivity

struct Card: Identifiable {
    let id: UUID?
    var name: String
    var image: Image
    var username = MCPeerID()
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
}
