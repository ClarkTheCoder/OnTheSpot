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
                Text("Scenario: ")
                    .padding(.top, 15)
                    
                Text(scenarioVM.currentScenario.question)
                    .padding(.top, 15)
                
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
