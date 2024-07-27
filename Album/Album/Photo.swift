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
    @Attribute(.externalStorage) var photo: Data
    
    init(name: String, photo: Data) {
        self.name = name
        self.photo = photo
    }
}
