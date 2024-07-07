//
//  ContentView.swift
//  Users
//
//  Created by Groo on 7/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    let layout = [
        GridItem(.adaptive(minimum: 150, maximum: 200))
    ]
    var body: some View {
        NavigationStack {
            if users.isEmpty {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: layout, content: {
                        ForEach(users, id: \.id) { user in
                            HStack {
                                Text(user.name)
                            }
                            .padding()
                            .background(.yellow)
                            .clipShape(.rect(cornerRadius: 30))
                            .overlay(
                                Circle()
                                    .foregroundColor(user.isActive ? .blue : .clear)
                                    .frame(width: 10), alignment: .topTrailing
                            )
                        }
                    })
                }
                .scrollBounceBehavior(.basedOnSize)
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
            guard let decoded = try? JSONDecoder().decode([User].self, from: data) else {
                print("Error: Failed to decode data")
                return
            }
            users = decoded
            print("decode data: success")
        } catch {
            print("Error: Invalid data")
        }
        
    }
}

#Preview {
    ContentView()
}
