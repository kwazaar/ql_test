//
//  ContentView.swift
//  ql_test
//
//  Created by Максим Сизов on 22.01.2024.
//

import SwiftUI
import PomoshAPI

struct WardsListView: View {
    
    @ObservedObject var viewModel = WardsListViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !viewModel.wardsList.isEmpty {
                LazyVStack(spacing : 20) {
                    ForEach(viewModel.wardsData) { data in
                        VStack {
                            Image(uiImage: data.image!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200, alignment: .center)
                            Text(data.name)
                        }
                        
                    }
                    if viewModel.wardsData.count < viewModel.wardsList.count {
                        Text("Загрузка списка...")
                            .onAppear {
                                viewModel.presentWardsList()
                            }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchListWards()
        }
    }
}

#Preview {
    WardsListView()
}
