//
//  EditProspectView.swift
//  HotProspects
//
//  Created by Groo on 8/6/24.
//

import SwiftUI

struct EditProspectView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    let states = ["contacted", "uncontacted"]
    @State var name: String
    @State var emailAdress: String
    @State var isContacted: Bool
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Email Address", text: $emailAdress)
            Picker("State", selection: $isContacted) {
                Text("contacted")
                    .tag(true)
                Text("uncontacted")
                    .tag(false)
            }
            .onChange(of: isContacted) {
                print("\(isContacted)")
            }
        }
        .navigationTitle("New Prospect")
        .toolbar {
            Button("Save") {
                modelContext.insert(Prospect(name: name, emailAddress: emailAdress, isContacted: true))
                dismiss()
            }
        }
    }
}

#Preview {
    EditProspectView(name: "unknown", emailAdress: "example", isContacted: true)
}
