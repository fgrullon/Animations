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
    @State private var dragAmount = CGSize.zero
    var body: some View {
        Button("Click here"){
            enable.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enable ? .blue : .red)
        .foregroundColor(.white)
        .clipShape(.rect(cornerRadius: enable ? 60 : 0))
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
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded{_ in
                        withAnimation(.bouncy){
                            dragAmount = .zero
                        }
                    }
            )
            
    }
}

#Preview {
    ContentView()
}
