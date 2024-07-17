//
//  ContentView.swift
//  BucketList
//
//  Created by Groo on 7/16/24.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isLocked = true
    var body: some View {
        VStack {
            if isLocked {
                Image(systemName: "lock")
                    .font(.largeTitle)
            } else {
                Image(systemName: "lock.open")
                    .font(.largeTitle)
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) { // check if biometric is possible
            let reason = "We need to unlock your daaaata"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    // when unlocking success
                    isLocked = false
                } else {
                    // when unlocking failed
                }
            }
        } else {
            // cannot use biometrics
        }
    }
}

#Preview {
    ContentView()
}
