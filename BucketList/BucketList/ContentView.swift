//
//  ContentView.swift
//  BucketList
//
//  Created by Groo on 7/16/24.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    var body: some View {
        Map {
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.coordinate) {
                    Text(location.name)
                        .padding()
                        .background(.yellow.gradient)
                        .clipShape(.capsule)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
