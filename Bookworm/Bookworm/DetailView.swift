//
//  DetailView.swift
//  Bookworm
//
//  Created by Groo on 7/1/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let book: Book
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .offset(x: -20, y: -10)
            }
            Text(book.title)
                .font(.title)
            Text(book.author)
                .font(.title3)
                .foregroundStyle(.secondary)
            RatingView(rating: .constant(book.rating))
                .padding()
            Text(book.review)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do {        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Title", author: "Test Author", genre: "Mystery", rating: 3, review: "This book was fun enough. But i didn't expect to be fun..")
        return DetailView(book: example)
    } catch {
        return Text("Error: Failed to create preview. \(error.localizedDescription)")
    }
}
