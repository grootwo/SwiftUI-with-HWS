//
//  Photo.swift
//  Album
//
//  Created by Groo on 7/26/24.
//

import Foundation
import SwiftData
import CoreLocation

@Model
class Photo: Identifiable {
    let id = UUID()
    var name: String
    @Attribute(.externalStorage) var photo: Data
    var longitude: Double?
    var latitude: Double?
    var coordinate: CLLocationCoordinate2D? {
        if let latitude = latitude {
            if let longitude = longitude {
                return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            }
        }
        return nil
    }
    
    init(name: String, photo: Data, longitude: Double?, latitude: Double?) {
        self.name = name
        self.photo = photo
        self.longitude = longitude
        self.latitude = latitude
    }
}
