//
//  OnBoading.swift
//  WolvesFarmers
//
//  Created by Antonio Scognamiglio on 17/01/23.
//

import SwiftUI

struct OnBoardingPage: View {
    
    let previousButton: Bool
    let nextButton: Bool
    let skipButton: Bool
    let startButton: Bool
    
    let title: LocalizedStringKey
    
    @Binding var selection: Int
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .teal]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Text("Gather 6 players minimum")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                    Image("sixPeople")
                        .padding(.vertical, 20)
                    
                    if previousButton {
                        Button {
                            withAnimation {
                                selection += 1
                            }
                        } label: {
                            Text("Previous")
                                .foregroundColor(.black)
                                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                                .background {
                                   RoundedRectangle(cornerRadius: 15)
                                        .fill(.yellow)
                                }
                        }

                    }
                    
                    if nextButton {
                        Button {
                            withAnimation {
                                selection += 1
                            }
                        } label: {
                            Text("Next")
                                .foregroundColor(.black)
                                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                                .background {
                                   RoundedRectangle(cornerRadius: 15)
                                        .fill(.yellow)
                                }
                        }
                    }
                }
            }
        }
    }
    
    
    struct OnBoardingPage_Previews: PreviewProvider {
        static var previews: some View {
            OnBoardingPage(previousButton: true, nextButton: true, skipButton: true, startButton: false, title: "Gather minimum 6 players", selection: .constant(0))
        }
    }
}
