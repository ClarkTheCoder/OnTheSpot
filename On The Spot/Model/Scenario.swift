//
//  Scenario.swift
//  On The Spot
//
//  Created by Carson Clark on 2023-12-26.
//

import Foundation
import SwiftUI


// make codable for userdefaults later
struct Scenario {
    let scenarioID = UUID()
    let question: String
    var previouslyDisplayed: Bool
}
