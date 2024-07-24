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
        .accessibilityElement()
        .accessibilityLabel("rating")
        .accessibilityValue(rating == 1 ? "1 star": "\(rating) stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maxRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                print("not handled")
            }
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
