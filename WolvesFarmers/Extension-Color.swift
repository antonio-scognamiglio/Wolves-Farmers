//
//  Extension-Color.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

extension Color {

    static let textBackgroundColor = Color("DarkBlue")
    static  let placeholderColor = Color("GrayPlace")
    
    static let color1 = Color("Gradient1")
    static let color2 = Color("Gradient2")
    
    static let backgroundColor = LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .bottom)
}
