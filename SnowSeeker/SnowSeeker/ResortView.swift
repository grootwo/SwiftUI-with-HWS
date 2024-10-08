//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Groo on 9/4/24.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(Favorites.self) var favorites
    let resort: Resort
    @State private var selectedFacility: Facility?
    @State private var isShowingMessage = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text(resort.imageCredit)
                                    .font(.caption)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.black.opacity(0.5))
                                    .clipShape(.capsule)
                            }
                        }
                            .padding()
                    )
                HStack {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                        VStack(spacing: 10) {
                            SkiDetailsView(resort: resort)
                        }
                        VStack(spacing: 10) {
                            ResortDetailsView(resort: resort)
                        }
                    } else {
                        SkiDetailsView(resort: resort)
                        ResortDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.primary.opacity(0.05))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                Group {
                    Text(resort.description)
                    Text("Facilities")
                        .font(.headline)
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                isShowingMessage = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $isShowingMessage, presenting: selectedFacility) { _ in
        } message: { facility in
            Text(facility.message)
        }
        .toolbar {
            Button("Favorite", systemImage: favorites.contains(resort) ? "heart.fill" : "heart") {
                if favorites.contains(resort) {
                    favorites.remove(resort)
                } else {
                    favorites.add(resort)
                }
            }
        }
    }
}

#Preview {
    ResortView(resort: .example)
        .environment(Favorites())
}
