//
//  LoadingView.swift
//  On The Spot
//
//  Created by Carson Clark on 2024-01-06.
//

import SwiftUI

struct LoadingView: View {
    let textToType = "It's about to get uncomfortable.."
    @State private var animatedText: String = ""
    
    var body: some View {
        ZStack {
            Image("loading-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                Text("On The Spot 😅")
                    .font(.custom("Pacifico-Regular", size: 40))
                    .padding(1)
                    .foregroundStyle(.white)
                Text(animatedText)
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
            }
            .onAppear{
                animateText()
            }
        }
    }
    
    func animateText() {
        
        for (index, character) in textToType.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.09) {
                animatedText.append(character)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}


#Preview {
    LoadingView()
}
