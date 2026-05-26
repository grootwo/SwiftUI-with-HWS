//
//  ContentView.swift
//  Edutainment
//
//  Created by Groo on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentView = 0
    @State private var numberOfTable = 1
    @State private var numberOfQuestion = 10
    @State private var score = 0
    var body: some View {
        if currentView == 0 {
            SettingView(currentView: $currentView, numberOfTable: $numberOfTable, numberOfQuestion: $numberOfQuestion)
        } else if currentView == 1 {
            QuestionView(currentView: $currentView, numberOfQuestion: $numberOfQuestion, numberOfTable: $numberOfTable, score: $score)
        } else {
            ResultView(currentView: $currentView, score: $score)
        }
    }
}

#Preview {
    ContentView()
}
