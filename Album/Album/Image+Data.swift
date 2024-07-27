//
//  Image+Data.swift
//  Album
//
//  Created by Groo on 7/27/24.
//

import Foundation
import SwiftUI
import UIKit

extension Image {
    init?(data: Data) {
        if let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            return nil
        }
    }
}
