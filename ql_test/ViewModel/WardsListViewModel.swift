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
    private lazy var imageCachingService = ImageCachingService()
    private var firstIndex = 0
    private var pageSize = 10
    private var image: UIImage = UIImage()
    
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
                
                guard let edges = data.data?.wards?.edges else { return }
                let sortedEdges = edges.sorted(by: {$0.node.publicInformation.name.displayName < $1.node.publicInformation.name.displayName })
                
                self.wardsList = sortedEdges
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func presentWardsList() {
        let dispatchGroup = DispatchGroup()
        
        currentPage += 1
//        print("Загрузка \(pageSize) подопечных \(currentPage)  страницы")
        DispatchQueue.global().async {
            for index in self.currentList {
                var fetchImage = UIImage()
                let node = self.wardsList[index].node
                let imageURL = URL(string: node.publicInformation.photo.url)!
                
                dispatchGroup.enter()
                
                self.imageCachingService.loadImage(from: imageURL, compressionQuality: 0.1) { image in
                    fetchImage = image!
                    dispatchGroup.leave()
                }
                dispatchGroup.wait()
                DispatchQueue.main.async {
                    self.wardsData.append(WardsModel(id: node.id, name: node.publicInformation.name.displayName, image: fetchImage))
                }
            }
        }
    }
}
