//
//  AlbumApp.swift
//  Album
//
//  Created by Groo on 7/26/24.
//

import SwiftUI
import SwiftData

@main
struct AlbumApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Photo.self)
    }
}
