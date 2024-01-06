//
//  LoadingView.swift
//  On The Spot
//
//  Created by Carson Clark on 2024-01-06.
//

import SwiftUI

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct LoadingView: View {
    let textToType = "It's about to get uncomfortable.."
    @State private var animatedText: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("On The Spot 😅")
                Text(animatedText)
            }
            .onAppear{
                animateText()
            }
        }
    }
    
    func animateText() {
        for (index, character) in textToType.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                animatedText.append(character)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}



#Preview {
    LoadingView()
}
