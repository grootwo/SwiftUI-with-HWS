//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Groo on 8/20/24.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Image(.example)
                    .resizable()
                    .frame(width: 64, height: 64)
                Text("@grootwo")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
            }

            VStack {
                Text("Full name:")
                Text("Groo Two")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
