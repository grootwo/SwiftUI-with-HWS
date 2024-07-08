//
//  UsersApp.swift
//  Users
//
//  Created by Groo on 7/7/24.
//

import SwiftUI
import SwiftData

@main
struct UsersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
