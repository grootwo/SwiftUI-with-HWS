//
//  ContentView.swift
//  GuessRockScissorsPaper
//
//  Created by Groo on 5/8/24.
//

import SwiftUI

struct ContentView: View {
    let choices = ["Rock", "Scissors", "Paper"]
    let choicesEmoji = ["✊", "✌️", "✋"]
    let situations = ["WIN", "LOSE"]
    @State var pickedChoice = Int.random(in: 0...2)
    @State var pickedSituation = Int.random(in: 0...1)
    @State var answer = ""
    @State var isShowingAlert = false
    @State var score = 0
    @State var numberOfQuestion = 1
    var body: some View {
        VStack(spacing: 30) {
            Text("\(numberOfQuestion) / 10")
                .font(.title3)
            Spacer()
            Text(choicesEmoji[pickedChoice])
                .font(.system(size: 200))
            Text("What is your choice to \(situations[pickedSituation])?")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            HStack {
                ForEach(0..<3) { choice in
                    Button(action: {
                        guessAnswer(selectedChoice: choice)
                        isShowingAlert = true
                    }, label: {
                        Text(choicesEmoji[choice])
                            .font(.system(size: 100))
                    })
                }
            }
            Spacer()
            Text("Your score: \(score)")
        }
        .padding()
        .alert(answer, isPresented: $isShowingAlert) {
            Button("Continue", action: setNewQuestion)
        } message: {
            if numberOfQuestion == 10 {
                Text("Your total score is \(score)!!!")
            } else {
                Text("Now your score is \(score)!")
            }
        }
    }
    
    func guessAnswer(selectedChoice: Int) {
        if pickedSituation == 0 {
            if pickedChoice == 0 && selectedChoice == 2 || pickedChoice == 1 && selectedChoice == 0 || pickedChoice == 2 && selectedChoice == 1 {
                answer = "Correct"
                score += 10
            } else {
                answer = "Wrong"
                score -= 10
            }
        } else {
            if pickedChoice == 0 && selectedChoice == 1 || pickedChoice == 1 && selectedChoice == 2 || pickedChoice == 2 && selectedChoice == 0 {
                answer = "Correct"
                score += 10
            } else {
                answer = "Wrong"
                score -= 10
            }
        }
    }
    
    func setNewQuestion() {
        pickedChoice = Int.random(in: 0...2)
        pickedSituation = Int.random(in: 0...1)
        numberOfQuestion += 1
        if numberOfQuestion == 11 {
            numberOfQuestion = 0
            score = 0
        }
    }
}

#Preview {
    ContentView()
}
