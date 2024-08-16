//
//  CardView.swift
//  Flashzilla
//
//  Created by Groo on 8/16/24.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    let card: Card
    @State private var isHidingAnswer = true
    @State private var offset = CGSize.zero
    var removal: (() -> Void)? = nil
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor
                    ? .white
                    : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    accessibilityDifferentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25)
                        .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                if !isHidingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
            }
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isHidingAnswer.toggle()
        }
    }
}

#Preview {
    CardView(card: .example)
}
