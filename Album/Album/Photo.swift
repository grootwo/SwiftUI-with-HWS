//
//  Photo.swift
//  Album
//
//  Created by Groo on 7/26/24.
//

import Foundation
import SwiftData

@Model
class Photo: Identifiable {
    let id = UUID()
    var name: String
    @Attribute(.externalStorage) var photoData: Data
    
    init(name: String, photoData: Data) {
        self.name = name
        self.photoData = photoData
    }
}
