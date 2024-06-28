//
//  RatingView.swift
//  Bookworm
//
//  Created by Groo on 6/28/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    let maxRating = 5
    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1) { i in
                Button(action: {
                    rating = i
                }, label: {
                    Image(systemName: "star.fill")
                        .foregroundColor(i > rating ? .black.opacity(0.2) : .yellow)
                })
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
