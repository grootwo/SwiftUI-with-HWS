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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    do {        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Title", author: "Test Author", genre: "Mystery", rating: 3, review: "This book was fun enough. But i didn't expect to be fun..")
        return DetailView(book: example)
    } catch {
        return Text("Error: Failed to create preview. \(error.localizedDescription)")
    }
}
