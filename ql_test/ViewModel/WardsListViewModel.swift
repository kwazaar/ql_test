//
//  ViewModel.swift
//  ql_test
//
//  Created by Максим Сизов on 22.01.2024.
//

import PomoshAPI
import Foundation
import SwiftUI

class WardsListViewModel: ObservableObject {
    
    @Published var wardsList: [WardsListQuery.Data.Wards.Edge] = []
    @Published var wardsData: [WardsModel] = []
    @Published var currentPage = 0
    private var firstIndex = 0
    private var pageSize = 20
    
    var currentList: Range<Int> {
        let startIndex = (currentPage - 1) * pageSize
        let endIndex = currentPage * pageSize
        return startIndex..<endIndex
    }
    
    func fetchListWards() {
        let queryWardsList = WardsListQuery()
        NetworkService.shared.apollo.fetch(query: queryWardsList) { result in
            switch result {
            case .success(let data):
                    self.wardsList = (data.data?.wards?.edges)!
                    self.wardsList.sort {$0.node.publicInformation.name.displayName < $1.node.publicInformation.name.displayName }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func presentWardsList() {
        currentPage += 1
        for index in currentList {
            let node = wardsList[index].node
            let imageCachingService = ImageCachingService()
            imageCachingService.loadImage(from: URL(string: node.publicInformation.photo.url)!) { image in
                if let image = image {
                    self.wardsData.append(WardsModel(id: node.id, name: node.publicInformation.name.displayName, image: image))
                }
            }
        }
    }
    
}
