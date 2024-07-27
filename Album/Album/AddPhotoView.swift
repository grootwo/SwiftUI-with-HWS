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
    @Environment(\.dismiss) var dismiss
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedPhoto: Image?
    @State private var name = ""
    var body: some View {
        VStack {
            Spacer()
            PhotosPicker(selection: $pickerItem, matching: .images) {
                if selectedPhoto == nil {
                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
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
                Task {
                    guard let imageData = try await pickerItem?.loadTransferable(type: Data.self) else { return }
                    let newPhoto = Photo(name: name, photo: imageData)
                    modelContext.insert(newPhoto)
                }
                dismiss()
            }
            .disabled(name == "" || pickerItem == nil)
        }
    }
}

#Preview {
    AddPhotoView()
}
