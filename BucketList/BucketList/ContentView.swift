//
//  ContentView.swift
//  BucketList
//
//  Created by Groo on 7/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Write and Read the data") {
            let data = Data("Test Data".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
