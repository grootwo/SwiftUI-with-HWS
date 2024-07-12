//
//  ContentView.swift
//  Instafilter
//
//  Created by Groo on 7/9/24.
//

import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var intensityAmount = 0.0
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Click to import a picture"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                Spacer()
                HStack {
                    Text("Intensity")
                    Slider(value: $intensityAmount)
                        .onChange(of: intensityAmount, applyProcess)
                }
                Button("Change filter", action: changeFilter)
            }
            .padding()
            .navigationTitle("Instafilter")
        }
    }
    func changeFilter() {
        
    }
    func loadImage()  {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcess()
        }
    }
    func applyProcess() {
        currentFilter.intensity = Float(intensityAmount)
        
        guard let outputImage = try currentFilter.outputImage else { return }
        guard let cgImage = try context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
