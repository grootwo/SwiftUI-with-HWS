//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Groo on 9/4/24.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(resort.id)
                    .resizable()
                    .scaledToFit()
                HStack {
                    SkiDetailsView(resort: resort)
                    ResortDetailsView(resort: resort)
                }
                .padding(.vertical)
                .background(.primary.opacity(0.05))
                Group {
                    Text(resort.description)
                    Text("Facilities")
                        .font(.headline)
                    Text(resort.facilities, format: .list(type: .and))
                }
                .padding()
            }
            .navigationTitle("\(resort.name), \(resort.country)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ResortView(resort: .example)
}
