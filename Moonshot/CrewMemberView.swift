//
//  CrewScrollView.swift
//  Moonshot
//
//  Created by Groo on 6/14/24.
//

import SwiftUI

struct CrewMemberView: View {
    let crewMember: Astronaut
    let role: String
    var body: some View {
        Image(crewMember.id)
            .resizable()
            .scaledToFit()
            .clipShape(.capsule)
            .frame(width: 104, height: 72)
            .overlay(
                Capsule()
                    .stroke(.white, lineWidth: 1)
            )
        VStack(alignment: .leading) {
            Text(crewMember.name)
                .font(.headline)
            Text(role)
                .font(.caption)
        }
        .foregroundColor(.white)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return CrewMemberView(crewMember: astronauts["aldrin"]!, role: "role example")
        .preferredColorScheme(.dark)
}
