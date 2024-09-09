//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Groo on 9/3/24.
//

import SwiftUI

enum SortOrder {
    case basic, resortName, countryName
}

struct ContentView: View {
    @State private var favorites = Favorites()
    @State private var searchText = ""
    @State private var sortOrder = SortOrder.basic
    var resorts: [Resort] = Bundle.main.decode(file: "resorts.json")
    @State private var filteredResorts = [Resort]()
//    var filteredResorts: [Resort] {
//        if searchText.isEmpty {
//            return resorts
//        } else {
//            return resorts.filter { $0.name.localizedStandardContains(searchText) }
//        }
//    }
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                            )
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Default")
                            .tag(SortOrder.basic)
                        Text("Sort by resort name")
                            .tag(SortOrder.resortName)
                        Text("Sort by country name")
                            .tag(SortOrder.countryName)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .onChange(of: searchText) {
                    if searchText.isEmpty {
                        filteredResorts = resorts
                    } else {
                        filteredResorts = resorts.filter { $0.name.localizedStandardContains(searchText) }
                    }
            }
            .onChange(of: sortOrder) {
                if sortOrder == .resortName {
                    filteredResorts.sorted { $0.name < $1.name }
                    print("name")
                } else if sortOrder == .countryName {
                    filteredResorts.sorted { $0.country < $1.country }
                    print("country")
                }
            }
        } detail: {
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}
