//
//  ContentView.swift
//  Calculator
//
//  Created by Groo on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .trailing) {
                Spacer()
                HStack {
                    Text("0")
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 20)
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        CustomButton(text: "AC", image: nil, isOrange: false, isGray: true)
                        CustomButton(text: nil, image: "plus.forwardslash.minus", isOrange: false, isGray: true)
                        CustomButton(text: nil, image: "percent", isOrange: false, isGray: true)
                        CustomButton(text: nil, image: "divide", isOrange: true, isGray: false)
                    }
                    
                    HStack(spacing: 10) {
                        CustomButton(text: "7", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: "8", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: "9", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: nil, image: "multiply", isOrange: true, isGray: false)
                    }
                    
                    HStack(spacing: 10) {
                        CustomButton(text: "4", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: "5", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: "6", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: nil, image: "minus", isOrange: true, isGray: false)
                    }
                    
                    HStack(spacing: 10) {
                        CustomButton(text: "1", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: "2", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: "3", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: nil, image: "plus", isOrange: true, isGray: false)
                    }
                    HStack(spacing: 10) {
                        Button(action: {
                            print("0 clicked")
                        }, label: {
                            Text("0")
                        })
                        .font(.largeTitle)
                        .frame(width: 150, height: 60)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.secondary)
                        .clipShape(.capsule)
                        CustomButton(text: ".", image: nil, isOrange: false, isGray: false)
                        CustomButton(text: nil, image: "equal", isOrange: true, isGray: false)
                    }
                    
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
