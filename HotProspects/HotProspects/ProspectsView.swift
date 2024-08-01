//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Groo on 8/1/24.
//

import SwiftUI
import SwiftData

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    var filterType: FilterType
    var title: String {
        switch filterType {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
        }
    }
    @Environment(\.modelContext) var modelContext
    @Query var prospects: [Prospect]
    var body: some View {
        NavigationStack {
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
            }
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let newProspect = Prospect(name: "Ollah", emailAddress: "email@email.com", isContated: false)
                        modelContext.insert(newProspect)
                    }
                }
        }
    }
    init(filterType: FilterType) {
        self.filterType = filterType
        if filterType != .none {
            let isContatedOnly = filterType == .contacted
            _prospects = Query(filter: #Predicate<Prospect> {
                $0.isContated == isContatedOnly
            }, sort: \Prospect.name)
        }
    }
}

#Preview {
    ProspectsView(filterType: .contacted)
}
