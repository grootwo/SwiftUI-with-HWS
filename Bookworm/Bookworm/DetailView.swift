//
//  DetailView.swift
//  Bookworm
//
//  Created by Groo on 7/1/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    let book: Book
    @State private var isShowingDeleteAlert = false
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
                    .offset(x: -10, y: -10)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(book.title)
                    .font(.title)
                    .bold()
                Text(book.author)
                    .font(.title3)
                Text("\(book.startDate.formatted(date: .abbreviated, time: .omitted)) ~ \(book.endDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.callout)
                RatingView(rating: .constant(book.rating))
                    .padding()
                HStack {
                    Text(book.review)
                    Spacer()
                }
            }
            .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .toolbar {
            Button("Delete book", systemImage: "trash") {
                isShowingDeleteAlert = true
            }
        }
        .alert("Delete this book", isPresented: $isShowingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
    }
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Title", author: "Test Author", genre: "Mystery", rating: 3, review: "This book was fun enough. But i didn't expect to be fun..", startDate: Date.now, endDate: Date.now)
        return DetailView(book: example)
    } catch {
        return Text("Error: Failed to create preview. \(error.localizedDescription)")
    }
}
