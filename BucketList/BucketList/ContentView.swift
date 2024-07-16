//
//  ContentView.swift
//  BucketList
//
//  Created by Groo on 7/16/24.
//

import SwiftUI

enum LoadingState {
    case before
    case loading
    case success
    case failed
}

struct ContentView: View {
    @State private var loadingState = LoadingState.before
    var body: some View {
        switch loadingState {
        case .before:
            BeforeView()
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

struct BeforeView: View {
    var body: some View {
        Text("Before View")
    }
}

struct LoadingView: View {
    var body: some View {
        Text("Loading View")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success View")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed View")
    }
}

#Preview {
    ContentView()
}
