//
//  PhotoView.swift
//  Album
//
//  Created by Groo on 7/27/24.
//

import SwiftUI

struct PhotoView: View {
    var photo: Photo
    var body: some View {
        Image(data: photo.photo)!
            .resizable()
            .scaledToFill()
            .navigationTitle(photo.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    PhotoView()
//}
