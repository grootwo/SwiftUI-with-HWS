//
//  ContentView.swift
//  Users
//
//  Created by Groo on 7/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    var body: some View {
        NavigationStack {
            if users.isEmpty {
                ProgressView()
            } else {
                List(users, id: \.id) { user in
                    HStack {
                        Text(user.name)
                        Text(String(user.isActive))
                    }
                }
                .navigationTitle("Users")
            }
        }
        .task {
            await loadUsers()
        }
    }
    func loadUsers() async {
        print("load users: start")
        // 1: read url
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Error: Invalid url")
            return
        }
        print("read url: success")
        do {
            // 2: fetch data
            let (data, _) = try await URLSession.shared.data(from: url)
            print("fetch data: success")
            // 3: decode data
            if let decoded = try? JSONDecoder().decode(Users.self, from: data) {
                users = decoded.users
                print("decode data: success")
            }
        } catch {
            print("Error: Invalid data")
        }
        
    }
}

#Preview {
    ContentView()
}
