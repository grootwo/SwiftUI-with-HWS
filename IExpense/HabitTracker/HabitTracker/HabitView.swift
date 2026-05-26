//
//  HabitView.swift
//  HabitTracker
//
//  Created by Groo on 6/20/24.
//

import SwiftUI

struct HabitView: View {
    @Binding var habit: Habit
    @State var successCount: Int
    @State var buttonColor = Color.random()
    var body: some View {
        VStack {
            Text("달성 횟수: \(successCount)")
            Spacer()
            Text(habit.description)
                .font(.title3)
            Spacer()
            Button(action: {
                successCount += 1
                habit.successCount = successCount
                buttonColor = Color.random()
            }, label: {
                    Label("오늘도 성공!", systemImage: "checkmark.circle")
                        .font(.title)
                        .foregroundColor(buttonColor)
            })
        }
        .padding()
    }
}

#Preview {
    HabitView(habit: .constant(Habit(title: "유도 업어 치기", description: "매일 상대방 아무나 10번 업어 치기")), successCount: 3)
}
