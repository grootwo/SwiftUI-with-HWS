//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Groo on 7/20/24.
//

import Foundation
import MapKit
import CoreLocation

extension ContentView {
    @Observable
    class ViewModel {
        var locations = [Location]()
        var selectedPlace: Location?
        
        func addLocation(at coordinate: CLLocationCoordinate2D) {
            locations.append(Location(id: UUID(), name: "new location", longitude: coordinate.longitude, latitude: coordinate.latitude))
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
    }
}
