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
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    var body: some View {
        NavigationStack {
            Text("people: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let newProspect = Prospect(name: "Ollah", emailAddress: "email@email.com", isContated: false)
                        modelContext.insert(newProspect)
                    }
                }
        }
    }
}

#Preview {
    ProspectsView(filterType: .contacted)
}
