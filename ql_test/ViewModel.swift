//
//  ViewModel.swift
//  ql_test
//
//  Created by Максим Сизов on 22.01.2024.
//

import PomoshAPI
import Foundation
import SwiftUI

class WardsViewModel: ObservableObject {
    
    @Published var wardsIds: [String] = []
    @Published var pageWardsIds: [String] = []
    @State private var currentPage = 0
    private var pageSize = 20
    
    var currentList: Range<Int> {
        let startIndex = currentPage * pageSize
        let endIndex = min(startIndex + pageSize, wardsIds.count)
        return startIndex..<endIndex
    }
    
    func fetchWardsIds() {
        let query = WardsByIdsQuery()
        NetworkService.shared.apollo.fetch(query: query) { [weak self] result in
            switch result {
                
            case .success(let data):
                self!.wardsIds = data.data?.wardsIds ?? []
                print(self!.wardsIds)
                self!.fetchWardsList()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    func fetchWardsList() {
        
        for numderInList in currentList {
            pageWardsIds.append(wardsIds[numderInList])
        }
        let queryList = WardsByIdsListQuery(listId: pageWardsIds)
        NetworkService.shared.apollo.fetch(query: queryList) { [weak self] result in
            switch result {
                
            case .success(let data):
                // Обработка данных
                print(data)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
