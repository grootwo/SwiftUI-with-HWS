//
//  LocationView.swift
//  BucketList
//
//  Created by Groo on 7/18/24.
//

import SwiftUI

struct EditPlaceView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    var onSave: (Location) -> Void
    @State private var name: String
    var body: some View {
        NavigationStack {
            Form {
                TextField("Place name", text: $name)
            }
            .navigationTitle("Selected Place")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
    }
}

#Preview {
    EditPlaceView(location: .example) { _ in }
}
