//
//  AddView.swift
//  HabitTracker
//
//  Created by Groo on 6/20/24.
//

import SwiftUI

struct AddView: View {
    var habits: Habits
    @Binding var isShowingAddView: Bool
    @State var title = ""
    @State var description = ""
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Input the habit's title", text: $title)
                }
                Section("Description") {
                    TextField("Describe about the habit", text: $description)
                        .multilineTextAlignment(.leading)
                }
            }
            .toolbar {
                Button(action: {
                    habits.items.append(Habit(title: title, description: description))
                    isShowingAddView = false
                }, label: {
                    Text("Save")
                })
            }
        }
    }
}
