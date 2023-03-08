//
//  OnBoardingView.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 17/01/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var selection = 0
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            TabView(selection: $selection) {
                OnBoarding(image: "sixPeople", startButton: false, skipButton: true, title: "Gather 6 players minimum", selection: $selection)
                    .tag(0)
                OnBoarding(image: "book", startButton: false, skipButton: true, title: "Read the instructions", selection: $selection)
                    .tag(1)
                OnBoarding(image: "village", startButton: false, skipButton: true, title: "Fight for your side", selection: $selection)
                    .tag(2)
                OnBoarding(image: "beware", startButton: true, skipButton: false, title: "Good luck and stay alive!", selection: $selection)
                    .tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
