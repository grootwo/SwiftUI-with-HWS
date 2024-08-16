//
//  CardView.swift
//  Flashzilla
//
//  Created by Groo on 8/16/24.
//

import SwiftUI

struct CardView: View {
    var card: Card
    @State private var isHidingAnswer = true
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
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
        .onTapGesture {
            isHidingAnswer.toggle()
        }
    }
}

#Preview {
    CardView(card: .example)
}
