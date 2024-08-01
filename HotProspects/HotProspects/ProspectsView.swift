//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Groo on 8/1/24.
//

import SwiftUI

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
    var body: some View {
        NavigationStack {
            Text("Hallo")
                .navigationTitle(title)
        }
    }
}

#Preview {
    ProspectsView(filterType: .contacted)
}
