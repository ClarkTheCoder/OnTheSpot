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
    @Published var currentScenarioIndex: Int = 0

    // intializde with array of scenario items
    init(scenarios: [Scenario]) {
        self.scenarios = scenarios
    }
    
    var currentScenario: Scenario {
        scenarios[currentScenarioIndex]
    }
    
    func nextScenario() {
        if currentScenarioIndex < scenarios.count - 1 {
            currentScenarioIndex += 1
        } else {
            currentScenarioIndex = 0
        }
    }
    
    func previousScenario() {
        if currentScenarioIndex <= 0 {
            currentScenarioIndex = 1
        }
        if currentScenarioIndex < scenarios.count - 1 {
            currentScenarioIndex -= 1
        }
    }
}
