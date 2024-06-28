//
//  ContentView.swift
//  Bookworm
//
//  Created by Groo on 6/27/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    @State private var isShowingSheet = false
    var body: some View {
        NavigationStack {
            Text("books count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "plus") {
                            isShowingSheet = true
                        }
                    }
                }
                .sheet(isPresented: $isShowingSheet) {
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
