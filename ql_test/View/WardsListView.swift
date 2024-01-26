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
                LazyVStack {
                    ForEach(viewModel.wardsData) { data in
                        NavigationLink {
                            WadrDetail(id: data.id)
                        } label: {
                            WadrCell(image: data.image ?? UIImage(), fullName: data.name)
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
        .background(Color(.systemGroupedBackground))
        .onAppear {
            viewModel.fetchListWards()
        }
    }
}

#Preview {
    WardsListView()
}
