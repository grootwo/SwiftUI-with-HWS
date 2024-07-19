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
    @State private var selectedPlace: Location?
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Text("❣️")
                            .font(.title)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    print("coordinate: \(coordinate)")
                    locations.append(Location(id: UUID(), name: "new location", longitude: coordinate.longitude, latitude: coordinate.latitude))
                }
            }
        }
        .sheet(item: $selectedPlace) { place in
            EditPlaceView(location: place) { newLocation in
                if let index = locations.firstIndex(of: place) {
                    locations[index] = newLocation
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
