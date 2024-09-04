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
        VStack(alignment: .leading, spacing: 20) {
            Image(resort.id)
                .resizable()
                .scaledToFit()
            Group {
                Text(resort.description)
                Text("Facilities")
                    .font(.headline)
                Text(resort.facilities.joined(separator: ", "))
            }
            .padding(.horizontal)
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ResortView(resort: .example)
}
