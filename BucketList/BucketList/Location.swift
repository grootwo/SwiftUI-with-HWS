//
//  Location.swift
//  BucketList
//
//  Created by Groo on 7/18/24.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    var id = UUID()
    var name: String
    var longitude: Double
    var latitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    #if DEBUG
    static let example = Location(id: UUID(), name: "Buckingham Palace", longitude: -0.141, latitude: 51.501)
    #endif
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
