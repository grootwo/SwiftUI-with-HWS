//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Groo on 7/3/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
