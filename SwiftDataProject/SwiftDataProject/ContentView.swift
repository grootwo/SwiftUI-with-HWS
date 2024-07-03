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
    @Query(sort: \User.name) var users: [User]
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add user", systemImage: "plus") {
                   
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
