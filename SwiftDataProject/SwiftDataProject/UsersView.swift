//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Groo on 7/4/24.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    Text(user.name)
                    Spacer()
                    Text(String(user.jobs.count))
                        .padding(7)
                        .foregroundStyle(.white)
                        .background(.secondary)
                        .clipShape(.circle)
                }
            }
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample() {
        let user1 = User(name: "unknown", city: "somewhere", joinDate: .now)
        var job1 = Job(name: "Meeting with workers", priority: 2)
        var job2 = Job(name: "Eating lunch", priority: 1)
        modelContext.insert(user1)
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
