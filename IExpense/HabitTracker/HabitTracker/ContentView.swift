//
//  ContentView.swift
//  HabitTracker
//
//  Created by Groo on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    @State var habits = Habits()
    @State var isShowingAddView = false
    var body: some View {
        NavigationStack {
            List {
                ForEach($habits.items, id: \.self) { $habit in
                    NavigationLink(destination: HabitView(habit: $habit, successCount: habit.successCount), label: {
                        HStack {
                            Text("\(habit.title)")
                                .font(.headline)
                            Spacer()
                            Image(systemName: "\(habit.successCount).circle.fill")
                        }
                    })
                    .tint(.secondary)
                }
            }
            .toolbar {
                Button(action: {
                    isShowingAddView = true
                }, label: {
                    Text("New Habit")
                })
            }
            .sheet(isPresented: $isShowingAddView) {
                AddView(habits: habits, isShowingAddView: $isShowingAddView)
            }
        }
    }
}

#Preview {
    ContentView()
}
