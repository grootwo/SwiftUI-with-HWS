//
//  AstronautView.swift
//  Moonshot
//
//  Created by Groo on 6/13/24.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView {
            Image(astronaut.id)
            VStack {
                Text(astronaut.description)
                    .foregroundStyle(.white)
            }
            .padding()
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
