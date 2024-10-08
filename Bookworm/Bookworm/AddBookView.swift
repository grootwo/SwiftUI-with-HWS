//
//  AddBookView.swift
//  Bookworm
//
//  Created by Groo on 6/28/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller", "Biography", "History", "Language", "Business", "Hobby", "Art", "Essay"]
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var rating = 3
    @State private var review = ""
    @State private var startDate = Date.now
    @State private var endDate = Date.now
    var body: some View {
        Form {
            Section("About Book") {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                Picker("Genre", selection: $genre) {
                    ForEach(genres, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section("Date") {
                DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                DatePicker("End Date", selection: $endDate, in: startDate..., displayedComponents: [.date])
            }
            Section("Review") {
                RatingView(rating: $rating)
                TextEditor(text: $review)
            }
            Section {
                Button("Save") {
                    let newBook = Book(title: title, author: author, genre: genre, rating: rating, review: review, startDate: startDate, endDate: endDate)
                    modelContext.insert(newBook)
                    dismiss()
                }
            }
            .disabled(title.isEmpty || (title.trimmingCharacters(in: .whitespacesAndNewlines)) == "")
        }
    }
}

#Preview {
    AddBookView()
}
