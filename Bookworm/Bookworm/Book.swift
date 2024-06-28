//
//  Book.swift
//  Bookworm
//
//  Created by Groo on 6/28/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var rating: Int
    var review: String
    
    init(title: String, author: String, genre: String, rating: Int, review: String) {
        self.title = title
        self.author = author
        self.genre = genre
        self.rating = rating
        self.review = review
    }
}
