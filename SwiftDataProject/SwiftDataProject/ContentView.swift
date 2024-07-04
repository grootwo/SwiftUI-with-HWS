//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Groo on 7/3/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var isShowingUpcoming = false
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: isShowingUpcoming ? .now : .distantPast)
            .navigationTitle("Users")
            .toolbar {
                Button("Add user", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                Button(isShowingUpcoming ? "Show everyone" : "Show upcoming") {
                    isShowingUpcoming.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
