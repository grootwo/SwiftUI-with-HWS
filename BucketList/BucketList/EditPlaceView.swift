//
//  LocationView.swift
//  BucketList
//
//  Created by Groo on 7/18/24.
//

import SwiftUI

struct EditPlaceView: View {
    @Environment(\.dismiss) var dismiss
    var onSave: (Location) -> Void
    @State private var viewModel: ViewModel
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                }
                Section("Nearby") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please, try again.")
                    }
                }
            }
            .navigationTitle("Selected Place")
            .toolbar {
                Button("Save") {
                    onSave(viewModel.createNewLocation())
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.onSave = onSave
        viewModel = ViewModel(location: location, name: location.name)
    }
}

#Preview {
    EditPlaceView(location: .example) { _ in }
}
