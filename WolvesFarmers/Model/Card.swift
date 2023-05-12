//
//  Card.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 17/01/23.
//

import Foundation
import SwiftUI
import MultipeerConnectivity

struct Card: Identifiable, Codable, Equatable {
    let id = UUID()
    var name: String
    var imageName: String
    var username: String = ""
    var isDeath: Bool = false
    var info: [String] = []
    var mainObjective: String = "To kill all the wolves."
    var day: String = "They express their vote to kill one person."
    var night: String = ""
    
    var image: Image {
        Image(imageName)
    }
    
}
