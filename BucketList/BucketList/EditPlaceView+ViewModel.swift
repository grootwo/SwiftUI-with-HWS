//
//  EditPlaceView+ViewModel.swift
//  BucketList
//
//  Created by Groo on 7/23/24.
//

import Foundation

extension EditPlaceView {
    enum LoadingState {
        case loading, loaded, failed
    }
    @Observable
    class ViewModel {
        var name: String
        var loadingState = LoadingState.loading
        var pages = [Page]()
        
        init(name: String) {
            self.name = name
        }
    }
}
