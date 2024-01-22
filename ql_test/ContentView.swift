//
//  ContentView.swift
//  ql_test
//
//  Created by Максим Сизов on 22.01.2024.
//

import SwiftUI
import PomoshAPI

struct ContentView: View {
    
    @ObservedObject var viewModel = WardsViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                viewModel.fetchWardsIds()
            } label: {
                Text("123")
            }
            Button {
                viewModel.fetchWardsList()
            } label: {
                Text("456")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
