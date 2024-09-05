//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Groo on 9/5/24.
//

import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>
    private let key = "Favorites"
    init() {
        // load favorite resorts
        resorts = []
    }
    func contains(_ resort: Resort) -> Bool {
        if resorts.contains(resort.id) {
            return true
        } else {
            return false
        }
    }
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    func save() {
        // save favorite resorts
    }
}
