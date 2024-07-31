//
//  ContentView.swift
//  Animations
//
//  Created by Frank Grullon on 29/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var enable = false
    var body: some View {
        Button("Click here"){
            enable.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enable ? .blue : .red)
        .foregroundColor(.white)
        .animation(.default, value: enable)
        
        Button("Tap Me"){
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

#Preview {
    ContentView()
}
