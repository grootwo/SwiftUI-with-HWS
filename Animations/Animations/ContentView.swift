//
//  ContentView.swift
//  Animations
//
//  Created by Groo on 5/17/24.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
            .modifier(
                active: CornerRotateModifier(amount: -90, anchor: .topLeading),
                identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
            )
        }
}

struct ContentView: View {
    @State private var isShowingElement = false
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.green)
                .frame(width: 200)
            if isShowingElement {
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingElement.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
