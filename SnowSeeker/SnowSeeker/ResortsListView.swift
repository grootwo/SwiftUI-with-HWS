////
////  ResortsListView.swift
////  SnowSeeker
////
////  Created by Groo on 9/6/24.
////
//
//import SwiftUI
//
//struct ResortsListView: View {
//    @State var resorts: [Resort]
//    @Binding var sortOrder: SortOrder
//    @State private var favorites = Favorites()
//    var body: some View {
//        List(resorts) { resort in
//            NavigationLink(value: resort) {
//                HStack {
//                    Image(resort.country)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 40, height: 25)
//                        .clipShape(.rect(cornerRadius: 5))
//                        .overlay(RoundedRectangle(cornerRadius: 5)
//                            .stroke(.black, lineWidth: 1)
//                        )
//                    VStack(alignment: .leading) {
//                        Text(resort.name)
//                            .font(.headline)
//                        Text("\(resort.runs) runs")
//                            .foregroundStyle(.secondary)
//                    }
//                    if favorites.contains(resort) {
//                        Spacer()
//                        Image(systemName: "heart.fill")
//                            .foregroundColor(.secondary)
//                    }
//                }
//            }
//        }
//        .environment(favorites)
//    }
//    init(filteredResorts: [Resort], sortOrder: SortOrder) {
//        if sortOrder == .basic {
//            resorts = filteredResorts
//        } else if sortOrder == .resortName {
//            resorts = filteredResorts.sorted { $0.name < $1.name }
//        } else {
//            resorts = filteredResorts.sorted { $0.country < $1.country }
//        }
//    }
////    init(favorites: Favorites = Favorites(), resorts: [Resort], sortOrder: SortOrder) {
////        self.favorites = favorites
////        self.resorts = resorts
////        self.sortOrder = sortOrder
////    }
//    
//}
//
//#Preview {
//    ResortsListView(filteredResorts: [.example, .example], sortOrder: .countryName)
//        .environment(Favorites())
//}
