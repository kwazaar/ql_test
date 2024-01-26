//
//  WardDetailViewModel.swift
//  ql_test
//
//  Created by Максим Сизов on 25.01.2024.
//

import Foundation
import PomoshAPI


class WardDetailViewModel: ObservableObject {
    
    @Published var modelWard = WardsModel()
    private lazy var imageCachingService = ImageCachingService()
    
    
    func fetchModel(id : String) {
        let query = WardsByIdsQuery(id: id)
        NetworkService.shared.apollo.fetch(query: query) { result in
            switch result {
                
            case .success(let data):
                
                if let ward = data.data?.wardById {
                    self.modelWard.name = ward.publicInformation.name.fullName
                    self.modelWard.city = ward.publicInformation.city
                    self.modelWard.story = ward.publicInformation.story
                    
                    if let url = URL(string: ward.publicInformation.photo.url) {
                        self.imageCachingService.loadImage(from: url, compressionQuality: 0.5) { image in
                            if let image = image {
                                self.modelWard.image = image
                            }
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}
