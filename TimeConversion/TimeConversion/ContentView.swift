//
//  ContentView.swift
//  TimeConversion
//
//  Created by Groo on 4/29/24.
//

import SwiftUI

enum typeOfTime {
    case Day, Hour, Minute, Second
}

struct ContentView: View {
    @State private var timeAmount = 0
    @State private var typeOfTimeInput = typeOfTime.Hour
    @State private var typeOfTimeOutput = typeOfTime.Minute
    let typesOfTime = [typeOfTime.Day, typeOfTime.Hour, typeOfTime.Minute, typeOfTime.Second]
    var timeConverted: Double {
        if typeOfTimeInput == typeOfTimeOutput {
            return Double(timeAmount)
        } else if typeOfTimeInput == .Day && typeOfTimeOutput == .Hour { // Day to
            return Double(timeAmount) * 24
        } else if typeOfTimeInput == .Day && typeOfTimeOutput == .Minute {
            return Double(timeAmount) * 24 * 60
        } else if typeOfTimeInput == .Day && typeOfTimeOutput == .Second {
            return Double(timeAmount) * 24 * 60 * 60
        } else if typeOfTimeInput == .Hour && typeOfTimeOutput == .Day { // Hour to
            return Double(timeAmount) / 24
        } else if typeOfTimeInput == .Hour && typeOfTimeOutput == .Minute {
            return Double(timeAmount) * 60
        } else if typeOfTimeInput == .Hour && typeOfTimeOutput == .Second {
            return Double(timeAmount) * 60 * 60
        } else if typeOfTimeInput == .Minute && typeOfTimeOutput == .Day { // Minute to
            return Double(timeAmount) / 60 / 24
        } else if typeOfTimeInput == .Minute && typeOfTimeOutput == .Hour {
            return Double(timeAmount) / 60
        } else if typeOfTimeInput == .Minute && typeOfTimeOutput == .Second {
            return Double(timeAmount) * 60
        } else if typeOfTimeInput == .Second && typeOfTimeOutput == .Day { // Second to
            return Double(timeAmount) / 60 / 60 / 24
        } else if typeOfTimeInput == .Second && typeOfTimeOutput == .Hour {
            return Double(timeAmount) / 60 / 60
        } else {
            return Double(timeAmount) / 60
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    Picker("typeOfTime", selection: $typeOfTimeInput) {
                        ForEach(typesOfTime, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Amount", value: $timeAmount, format: .number)
                }
                Section("Output") {
                    Picker("typeOfTime", selection: $typeOfTimeOutput) {
                        ForEach(typesOfTime, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(timeConverted, format: .number)
                }
            }
            .navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}
