//
//  CustomDividerView.swift
//  Moonshot
//
//  Created by Groo on 6/14/24.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDividerView()
}
