//
//  LocationView.swift
//  BucketList
//
//  Created by Groo on 7/18/24.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    @State private var name: String
    var body: some View {
        Form {
            TextField("Place name", text: $name)
        }
        .navigationTitle("Selected Place")
        .toolbar {
            Button("Save") {
                dismiss()
            }
        }
    }
    init(location: Location) {
        self.location = location
        _name = State(initialValue: location.name)
    }
}

#Preview {
    LocationView(location: .example)
}
