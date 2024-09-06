//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Groo on 9/5/24.
//

import SwiftUI

@Observable
class Favorites: Codable {
    private var resorts: Set<String>
    private let key = "Favorites"
    let savePath = URL.documentsDirectory.appending(path: "FavoriteResorts")
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            let decoded = try JSONDecoder().decode(Set<String>.self, from: data)
            resorts = decoded
        } catch {
            resorts = []
        }
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
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}
