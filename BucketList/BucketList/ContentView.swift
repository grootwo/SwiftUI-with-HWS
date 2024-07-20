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
    @State private var viewModel = ViewModel()
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(viewModel.locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Text("❣️")
                            .font(.title)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                viewModel.selectedPlace = location
                            }
                    }
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    viewModel.addLocation(at: coordinate)
                }
            }
        }
        .sheet(item: $viewModel.selectedPlace) { place in
            EditPlaceView(location: place) {
                viewModel.update(location: $0)
            }
        }
    }
}

#Preview {
    ContentView()
}
