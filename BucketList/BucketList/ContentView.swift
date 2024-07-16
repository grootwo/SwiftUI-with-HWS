//
//  ContentView.swift
//  BucketList
//
//  Created by Groo on 7/16/24.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    let people = [
        Person(firstName: "철수", lastName: "팽"),
        Person(firstName: "지현", lastName: "선우"),
        Person(firstName: "민수", lastName: "제갈")
    ].sorted {
        $0.lastName < $1.lastName
    }
    var body: some View {
        List(people) { person in
            Text("\(person.lastName) \(person.firstName)")
        }
    }
}

#Preview {
    ContentView()
}
