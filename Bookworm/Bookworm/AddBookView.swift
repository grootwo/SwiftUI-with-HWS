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
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var rating = 3
    @State private var review = ""
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
            Section("Review") {
                Picker("Rating", selection: $rating) {
                    ForEach(1..<6) {
                        Text("\($0)")
                    }
                }
                TextEditor(text: $review)
            }
            Section {
                Button("Save") {
                    let newBook = Book(title: title, author: author, genre: genre, rating: rating, review: review)
                    modelContext.insert(newBook)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddBookView()
}
