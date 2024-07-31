//
//  ContentView.swift
//  HotProspects
//
//  Created by Groo on 7/29/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("get permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("got permission")
                    } else {
                        print("error: \(error?.localizedDescription)")
                    }
                }
            }
            Button("send notification") {
                let content = UNMutableNotificationContent()
                content.title = "💡 This is notification"
                content.body = "You are lucky 🍀"
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    ContentView()
}
