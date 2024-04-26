//
//  ContentView.swift
//  WeSplit
//
//  Created by Groo on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("This is a Form in Section 1")
                Text("This is a Form")
            }
            Section {
                Text("This is a Form in Section 2")
                Text("This is a Form")
            }
        }
    }
}

#Preview {
    ContentView()
}
