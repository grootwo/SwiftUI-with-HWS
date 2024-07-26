//
//  AddPhotoView.swift
//  Album
//
//  Created by Groo on 7/26/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddPhotoView: View {
    @Environment(\.modelContext) var modelContext
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedPhoto: Image?
    @State private var name = ""
    var body: some View {
        VStack {
            Spacer()
            PhotosPicker(selection: $pickerItem, matching: .images) {
                if selectedPhoto == nil {
                    Image(systemName: "photo.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .padding()
                } else {
                    selectedPhoto!
                        .resizable()
                        .scaledToFit()
                }
            }
            .onChange(of: pickerItem) {
                Task {
                    selectedPhoto = try await pickerItem?.loadTransferable(type: Image.self)
                }
            }
            Spacer()
            TextField("Write a title of this photo", text: $name)
                .font(.title)
        }
        .padding()
        .toolbar {
            Button("Save") {
                // inset a photo into modelContext
            }
        }
    }
}

#Preview {
    AddPhotoView()
}
