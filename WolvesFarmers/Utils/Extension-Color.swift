//
//  Extension-Color.swift
//  WolvesFarmers
//
//  Created by Alessia Andrisani on 17/01/23.
//

import SwiftUI

extension Color {

    static let textBackgroundColor = Color("DarkBlue")
    static let placeholderColor = Color("GrayPlace")
    static let yellowButton = Color("ChevronColor")
    static let howToPlayColor = Color("1E1F24Color")
    
    static let color1 = Color("Gradient1")
    static let color2 = Color("Gradient2")
    
    static let textYellow = Color("YellowText")
    
    static let backgroundColor = LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .bottom)
    static let backgroundColorDark = LinearGradient(gradient: Gradient(colors: [textBackgroundColor, color2]), startPoint: .top, endPoint: .bottom)
    static let cardColorGradient = LinearGradient(gradient: Gradient(colors: [Color("CardColor1"), Color("CardColor2")]), startPoint: .top, endPoint: .bottom)
}
