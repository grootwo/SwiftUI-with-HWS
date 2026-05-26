//
//  ContentView.swift
//  GuessFlags
//
//  Created by Groo on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var selectedCountry = Int.random(in: 0...2)
    @State private var result = ""
    @State private var showingScore = false
    @State private var score = 0
    @State private var questionStatus = 1
    let labels = [
        "Estonia": "가로로 세 줄인 깃발. 위에서부터 파랑, 검정, 흰색.",
            "France": "세로로 세 줄인 깃발. 왼쪽부터 파랑, 하양, 빨강색.",
            "Germany": "가로로 세 줄인 깃발. 위에서부터 검정, 빨강, 노랑색.",
            "Ireland": "세로로 세 줄일 깃발. 왼쪽부터 초록, 흰, 주황색.",
            "Italy": "세로로 세 줄인 깃발. 왼쪽부터 초록, 흰, 빨강색.",
            "Nigeria": "세로로 세 줄인 깃발. 왼쪽부터 초록, 흰, 초록색.",
            "Poland": "가로로 두 줄인 깃발. 위에서부터 흰, 빨강색.",
            "Spain": "가로로 세 줄인 깃발. 위에서부터 얇은 빨강 줄 사이, 두꺼운 노랑과 국장.",
            "UK": "파랑색 배경에 흰색과 빨강색 십자가가 겹쳐진 깃발.",
            "Ukraine": "가로로 두 줄인 깃발. 위에서부터 파랑, 노랑색.",
            "US": "빨강색과 흰색의 줄무니가 있고 왼쪽 위는 파랑색 배경에 흰색 별이 있는 깃발."
    ]
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .cyan, location: 0.3),
                .init(color: .indigo, location: 0.6),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[selectedCountry])
                            .font(.largeTitle.weight(.bold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            guessFlag(selectedAnswer: number)
                        } label: {
                            FlagImage(flagName: countries[number])
                        }
                        .accessibilityLabel(labels[countries[number], default: "Unkown flag"])
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 30)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Text("Score: \(score)")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Spacer()
                Text("\(questionStatus)/8 questions")
                    .font(.title.bold())
                    .foregroundStyle(.white)
            }
            .padding()
        }
        .alert(result, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if questionStatus == 8 {
                Text("Your total score is \(score)")
            } else {
                Text("Your score is \(score)")
            }
        }
    }
    
    func guessFlag(selectedAnswer: Int) {
        if selectedAnswer == selectedCountry {
            result = "Correct! It's the flag of \(countries[selectedAnswer])"
            score += 10
        } else {
            result = "Wrong! That's the flag of \(countries[selectedAnswer])"
            score -= 10
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        selectedCountry = Int.random(in: 0...2)
        questionStatus += 1
        if questionStatus == 9 {
            questionStatus = 1
            score = 0
        }
    }
}

struct FlagImage: View {
    let flagName: String
    var body: some View {            
        Image(flagName)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
    }
}

#Preview {
    ContentView()
}
