//
//  ContentView.swift
//  BucketList
//
//  Created by Groo on 7/16/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let startPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 56, longitude: -3), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
    @State private var locations = [Location]()
    let emojis = ["🐹", "🍦", "🍺", "⚽️"]
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Text(emojis[Int.random(in: 0..<emojis.count)])
                            .font(.title)
                            .background(.white)
                            .clipShape(.circle)
                            .frame(width: 40, height: 40)
                    }
                    .annotationTitles(.hidden)
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    print("coordinate: \(coordinate)")
                    locations.append(Location(name: "new location", longitude: coordinate.longitude, latitude: coordinate.latitude))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
