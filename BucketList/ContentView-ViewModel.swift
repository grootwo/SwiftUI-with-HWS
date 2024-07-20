//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Groo on 7/20/24.
//

import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        var locations = [Location]()
        var selectedPlace: Location?
    }
}
