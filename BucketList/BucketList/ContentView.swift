//
//  ContentView.swift
//  BucketList
//
//  Created by Groo on 7/16/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.5200066, longitude: 13.404954), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    var body: some View {
        VStack {
            Map(position: $position)
                .mapStyle(.hybrid)
                .onMapCameraChange { context in
                    print(context.region)
                }
            HStack {
                Button("Berlin") {
                    position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.5200066, longitude: 13.404954), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
                }
                Button("Busan") {                        
                    position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.2100142, longitude: 129.0688702), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
