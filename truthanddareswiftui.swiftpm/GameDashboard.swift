//
//  File.swift
//  truthanddareswiftui
//
//  Created by Jay Buddhdev on 24/04/22.
//

import SwiftUI

struct GameDashboard: View {
    @Binding var Counter: Int
    @State private var isRotate = false;
    @State private var degreeToRotate = 0;
    @State private var isAnimating = false
    @State private var showProgress = false
    @State private var playerNumber = 1
    @State var buttonIsHidden = 0
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
    }
    var body: some View {
        VStack {
            Text("Tap Bottle to Reset")
                .opacity( buttonIsHidden % 2 != 0 ? 0 : 1)
            Spacer().frame(minWidth: 0, maxWidth: 300)
            Button(action: { self.showProgress.toggle()
                playerNumber = Int.random(in: 1...Counter)
                degreeToRotate = playerNumber
                degreeToRotate *= (360 / Counter)
                
                
                degreeToRotate += 360
                buttonIsHidden += 1
                
            }, label: {
                if showProgress {
                    Image("bottle")
                        .resizable()
                        .frame(maxWidth: 350,maxHeight: 350)
                        .rotationEffect(Angle(degrees: self.isAnimating ? Double(degreeToRotate) : 0.0))
                        .animation(self.isAnimating ? foreverAnimation : .default)
                        .onAppear { self.isAnimating = true }
                        .onDisappear { self.isAnimating = false }
                    
                } else {
                    Image("bottle")
                        .resizable()
                        .frame(maxWidth: 350,maxHeight: 350)
                }
                
                
                
            })
            .onAppear { self.showProgress = true }
            Spacer().frame(minHeight: 10, maxHeight: 100)
            
        }
    }
    
}
