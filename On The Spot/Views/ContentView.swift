//
//  ContentView.swift
//  On The Spot
//
//  Created by Carson Clark on 2023-12-26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var scenarioVM = ScenarioViewModel(scenarios: ScenarioBrain().scenarioArray)
    
    var body: some View {
        ZStack {
            Image("background-main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Text(scenarioVM.currentScenario.question)
                    .padding(15)
                    .background(
                        Color.blue,
                        in: RoundedRectangle(cornerRadius: 10)
                    )
                
                Spacer()
                Button("Next") {
                    scenarioVM.nextScenario()
                    print("Button clicked")
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
