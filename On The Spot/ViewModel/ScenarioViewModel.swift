//
//  ScenarioViewModel.swift
//  On The Spot
//
//  Created by Carson Clark on 2023-12-26.
//

import Foundation
import SwiftUI

class ScenarioViewModel: ObservableObject {
    @Published private var scenarios: [Scenario]
    @Published var currentScenarioIndex = 0
    @Published var previousScenarioIndex = 0
    
    // intializde with array of scenario items
    init(scenarios: [Scenario]) {
        self.scenarios = scenarios
    }
    
    var currentScenario: Scenario {
        scenarios[currentScenarioIndex]
    }
    
    func nextScenario() {
           if scenarios.count > 1 {
               // Filter out scenarios that have already been displayed
               let remainingScenarios = scenarios.filter { !$0.previouslyDisplayed }
               
               if remainingScenarios.isEmpty {
                   // Reset the "previouslyDisplayed" flag for all scenarios
                   for index in scenarios.indices {
                       scenarios[index].previouslyDisplayed = false
                   }
               }
               
               var newIndex = currentScenarioIndex
               
               // Keep generating a new index until a unique, not-previously-displayed scenario is found
               repeat {
                   newIndex = Int.random(in: 0..<scenarios.count)
               } while scenarios[newIndex].previouslyDisplayed
               
               // Mark the scenario as displayed
               scenarios[newIndex].previouslyDisplayed = true
               
               previousScenarioIndex = currentScenarioIndex
               currentScenarioIndex = newIndex
           } else {
               currentScenarioIndex = Int.random(in: 0..<scenarios.count)
           }
       }
    
    // get this isn't what I thought it would be.
    func previousScenario() {
        if currentScenarioIndex <= 0 {
            currentScenarioIndex = 1
        }
        if currentScenarioIndex < scenarios.count - 1 {
            currentScenarioIndex = previousScenarioIndex
        }
    }
}
