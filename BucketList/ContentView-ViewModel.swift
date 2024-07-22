//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Groo on 7/20/24.
//

import Foundation
import MapKit
import CoreLocation
import LocalAuthentication

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedPlace: Location?
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        var isUnlocked = false
        var isShowingAlert = false
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                let decoded = try JSONDecoder().decode([Location].self, from: data)
                locations = decoded
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation(at coordinate: CLLocationCoordinate2D) {
            locations.append(Location(id: UUID(), name: "new location", longitude: coordinate.longitude, latitude: coordinate.latitude))
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        print("Unable to unlock: \(String(describing: error))")
                    }
                }
            } else {
                self.isShowingAlert = true
                print("Unable to use biometrics")
            }
        }
    }
}
