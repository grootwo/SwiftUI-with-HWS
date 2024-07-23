//
//  EditPlaceView+ViewModel.swift
//  BucketList
//
//  Created by Groo on 7/23/24.
//

import Foundation

extension EditPlaceView {
    @Observable
    class ViewModel {
        enum LoadingState {
            case loading, loaded, failed
        }
        var name: String
        var loadingState = LoadingState.loading
        var pages = [Page]()
        
        // location name 설정
        // save 설정
        // fetchNearbyPlaces
    }
}
