//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Groo on 7/29/24.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
