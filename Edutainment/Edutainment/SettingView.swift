//
//  SettingView.swift
//  Edutainment
//
//  Created by Groo on 5/28/24.
//

import SwiftUI

struct SettingView: View {
    @Binding var currentView: Int
    @Binding var numberOfTable: Int
    @Binding var numberOfQuestion: Int
    let numbersOfQuestions = [5, 10, 20]
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            Text("Which multiplication tables do you want to practice?")
                .font(.title2)
            Stepper("table of \(numberOfTable)", value: $numberOfTable, in: 1...9, step: 1)
            Text("How many questions do you want to play?")
                .font(.title2)
            Picker("number of questions", selection: $numberOfQuestion, content: {
                ForEach(numbersOfQuestions, id: \.self) { number in
                    Text(number, format: .number)
                        .foregroundStyle(.secondary)
                }
            })
            .pickerStyle(.segmented)
            Spacer()
            Button(action: {
                currentView = 1
            }, label: {
                Label("Go to pop!", systemImage: "frying.pan.fill")
                    .font(.title)
            })
            .padding()
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            .tint(.yellow)
        }
        .padding()
    }
}

#Preview {
    SettingView(currentView: .constant(1), numberOfTable: .constant(1), numberOfQuestion: .constant(1))
}
