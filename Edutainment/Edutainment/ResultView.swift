//
//  ResultView.swift
//  Edutainment
//
//  Created by Groo on 5/28/24.
//

import SwiftUI

struct ResultView: View {
    @Binding var currentView: Int
    @Binding var score: Int
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "popcorn.fill")
                .resizable()
                .frame(width: 100, height: 130)
                .foregroundColor(.yellow)
            Text("Yay! you made \(score) popcorns!")
                .font(.title2)
            Spacer()
            Text("Do you want to pop again?")
            Button(action: {
                startNewGame()
            }, label: {
                Label("Go to pop!", systemImage: "frying.pan.fill")
                    .font(.title)
            })
            .buttonStyle(.bordered)
            .tint(.yellow)
            
        }
        .padding()
    }
    func startNewGame() {
        score = 0
        currentView = 0
    }
}

#Preview {
    ResultView(currentView: .constant(2), score: .constant(4))
}
