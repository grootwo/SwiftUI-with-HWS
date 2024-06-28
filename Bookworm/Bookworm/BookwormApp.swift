//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Groo on 6/27/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
