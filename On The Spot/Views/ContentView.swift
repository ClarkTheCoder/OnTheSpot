//
//  ContentView.swift
//  On The Spot
//
//  Created by Carson Clark on 2023-12-26.

import SwiftUI

extension Color {
    
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

struct ContentView: View {
    @State private var isLoading = false
    @ObservedObject var scenarioVM = ScenarioViewModel(scenarios: ScenarioBrain().scenarioArray)
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
                    .onAppear{
                    Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
                        isLoading = false
                        timer.invalidate()
                    }
                }
            } else {
                ZStack {
                    Image("background-main")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        Text("On The Spot 😅")
                            .font(.custom("Pacifico-Regular", size: 40))
                            .foregroundStyle(Color(hex: 0x1747))
                        VStack {
                            Text(scenarioVM.currentScenario.question)
                                .padding(15)
                                .foregroundStyle(Color(hex: 0x1747))
                        }
                        .frame(height: 140)
                        
                        NavigationButton(buttonText: "Next", action: { scenarioVM.nextScenario() }, defaultColor: Color(hex: 0xA8DB), tappedColor: Color(hex: 0xFFE302), textColorDefault: .white, textColorTapped: Color(hex: 0x1747))
                        NavigationButton(buttonText: "Back", action: { scenarioVM.nextScenario() }, defaultColor: Color(hex: 0x1747), tappedColor: Color(hex: 0xFFE302), textColorDefault: .white, textColorTapped: Color(hex: 0x1747))
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}

struct NavigationButtonStyle: ButtonStyle {
    var defaultColor: Color
    var tappedColor: Color
    var textColorDefault: Color
    var textColorTapped: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? textColorTapped : textColorDefault )
            .padding(.init(top: 10, leading: 90, bottom: 10, trailing: 90))
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(configuration.isPressed ? tappedColor : defaultColor)
            )
    }
}

struct NavigationButton: View {
    let buttonText: String
    let action: () -> Void
    let defaultColor: Color
    let tappedColor: Color
    var textColorDefault: Color
    var textColorTapped: Color

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .buttonStyle(NavigationButtonStyle(defaultColor: defaultColor, tappedColor: tappedColor, textColorDefault: textColorDefault, textColorTapped: textColorTapped))
    }
}

#Preview {
    ContentView()
}


