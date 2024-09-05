//
//  Facility.swift
//  SnowSeeker
//
//  Created by Groo on 9/5/24.
//

import Foundation
import SwiftUI

struct Facility {
    let id = UUID()
    var name: String
    private let icons = [
        "Accommodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "map",
        "Eco-friendly": "leaf.arrow.circlepath",
        "Family": "person.3"
    ]
    var icon: some View {
        if let iconName = icons[name] {
            Image(systemName: iconName)
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }
}
