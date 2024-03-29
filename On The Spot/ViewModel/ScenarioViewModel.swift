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
          if currentScenarioIndex < scenarios.count - 1  {
              // If all scenarios have been shown at least once, reset the se
              previousScenarioIndex = currentScenarioIndex
              currentScenarioIndex += 1
          } else {
              currentScenarioIndex = 0
          }
      }
    
    func previousScenario() {
        if currentScenarioIndex == 0 {
            currentScenarioIndex = scenarios.count - 1
        }else {
            currentScenarioIndex -= 1
        }
    }
    
    func updateProgress() -> Float {
            let totalScenarios = Float(scenarios.count)
            let progressValue = Float(currentScenarioIndex + 1) / totalScenarios
            return progressValue
        }
}
