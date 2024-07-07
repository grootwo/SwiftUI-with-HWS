//
//  UserView.swift
//  Users
//
//  Created by Groo on 7/7/24.
//

import SwiftUI

struct UserView: View {
    var user: User
    var body: some View {
        ScrollView {
                Text(user.name)
                    .font(.title)
                    .padding()
                    .background(.cyan)
                    .clipShape(.rect(cornerRadius: 30))
                    .overlay(
                        Circle()
                            .foregroundColor(user.isActive ? .yellow : .clear)
                            .frame(width: 10), alignment: .topTrailing
                    )
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 20) {
                    Image(systemName: "tag")
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(user.tags, id: \.self) { tag in
                                Text(tag)
                            }
                        }
                    }
                }
                Label(user.email, systemImage: "envelope")
                Label(user.company, systemImage: "building")
                Label(user.address, systemImage: "house")
                Label(user.about, systemImage: "smiley")
                HStack(spacing: 20) {
                    Image(systemName: "person.3")
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(user.friends, id: \.self) { friend in
                                Text(friend.name)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    UserView(user: User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: true, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: "2015-11-10T01:47:18-00:00", tags: [
        "cillum",
        "consequat",
        "deserunt",
        "nostrud",
        "eiusmod",
        "minim",
        "tempor"
    ], friends: [Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"), Friend(id: "5890bacd-f49c-4ea2-b8fa-02db0e083238", name: "Karin Collins")]))
}
