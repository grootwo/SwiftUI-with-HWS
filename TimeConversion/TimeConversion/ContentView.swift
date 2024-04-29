//
//  ContentView.swift
//  TimeConversion
//
//  Created by Groo on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var timeAmount = 0
    @State private var typeOfTime = "hour"
    let typesOfTime = ["Day", "Hour", "Minute", "Second"]
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    Picker("typeOfTime", selection: $typeOfTime) {
                        ForEach(typesOfTime, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Amount", value: $timeAmount, format: .number)
                }
            }
            .navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}
