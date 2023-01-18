//
//  OnBoading.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 17/01/23.
//

import SwiftUI

struct OnBoarding: View {
    
    let image: String
    let startButton: Bool
    let skipButton: Bool
    let title: LocalizedStringKey
    
    @Binding var selection: Int
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        Spacer()
                    Image(image)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    Spacer()
                    if skipButton {
                        Button {
                            withAnimation {
                               showOnboarding = false
                            }
                        } label: {
                            Text("Skip the introduction")
                                .foregroundColor(Color.yellowButton)
                                .fontWeight(.medium)
                                .padding()
                        }
                    }

                    if startButton {
                        Button {
                            withAnimation {
                                showOnboarding = false
                            }
                        } label: {
                            Text("Get Started!")
                                .foregroundColor(.black)
                                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                                .background {
                                   RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.yellowButton)
                                }
                        }
                    }
                Spacer()
                Spacer()
                }
        }
    }
    
    
    struct OnBoarding_Previews: PreviewProvider {
        static var previews: some View {
            OnBoarding(image: "sixPeople", startButton: true, skipButton: false, title: "Gather minimum 6 players", selection: .constant(0))
        }
    }
}
