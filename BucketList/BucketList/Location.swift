//
//  Location.swift
//  BucketList
//
//  Created by Groo on 7/18/24.
//

import Foundation

struct Location: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var longitude: Double
    var latitude: Double
}
