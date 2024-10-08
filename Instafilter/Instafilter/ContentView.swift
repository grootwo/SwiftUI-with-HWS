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
import StoreKit

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var intensityAmount = 0.4
    @State private var scaleAmount = 0.4
    @State private var widthAmount = 0.4
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showingConfirmationDialog = false
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
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
                    Spacer()
                    Slider(value: $intensityAmount)
                        .onChange(of: intensityAmount, applyProcess)
                        .disabled(processedImage == nil ? true : false)
                }
                HStack {
                    Text("Scale")
                    Spacer()
                    Slider(value: $scaleAmount)
                        .onChange(of: scaleAmount, applyProcess)
                        .disabled(processedImage == nil ? true : false)
                }
                HStack {
                    Text("Width")
                    Spacer()
                    Slider(value: $widthAmount)
                        .onChange(of: widthAmount, applyProcess)
                        .disabled(processedImage == nil ? true : false)
                }
                HStack {
                    Button("Change filter", action: changeFilter)
                        .disabled(processedImage == nil ? true : false)
                    Spacer()
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Processed Image", image: processedImage))
                    }
                }
            }
            .padding()
            .navigationTitle("Instafilter")
            .confirmationDialog("Change filter", isPresented: $showingConfirmationDialog) {
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Dotscreen") { setFilter(CIFilter.dotScreen()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("X-Ray") { setFilter(CIFilter.xRay()) }
                Button("Circularscreen") { setFilter(CIFilter.circularScreen()) }
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    func changeFilter() {
        showingConfirmationDialog = true
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
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(intensityAmount, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(intensityAmount * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(scaleAmount * 10, forKey: kCIInputScaleKey) }
        if inputKeys.contains(kCIInputWidthKey) { currentFilter.setValue(widthAmount * 10, forKey: kCIInputWidthKey) }
        
        guard let outputImage = try currentFilter.outputImage else { return }
        guard let cgImage = try context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        filterCount += 1
        if filterCount % 10 == 1 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
