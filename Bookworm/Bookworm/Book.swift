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
    var startDate: Date
    var endDate: Date
    
    init(title: String, author: String, genre: String, rating: Int, review: String, startDate: Date, endDate: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.rating = rating
        self.review = review
        self.startDate = startDate
        self.endDate = endDate
    }
}
