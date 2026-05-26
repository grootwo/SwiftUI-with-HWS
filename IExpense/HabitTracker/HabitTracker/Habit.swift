//
//  Habit.swift
//  HabitTracker
//
//  Created by Groo on 6/20/24.
//

import Foundation

struct Habit: Hashable, Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var successCount = 0
}

@Observable
class Habits {
    var items = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
