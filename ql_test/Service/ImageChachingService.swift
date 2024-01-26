//
//  ImageChachingService.swift
//  ql_test
//
//  Created by Максим Сизов on 24.01.2024.
//

import Foundation
import SwiftUI

class ImageCachingService: ObservableObject {
    
      
    func loadImage(from url: URL, compressionQuality: CGFloat , completion: @escaping (UIImage?) -> Void) {
        let request = URLRequest(url: url)
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            if let compressedData = UIImage(data: cachedResponse.data)?.jpegData(compressionQuality: (compressionQuality)) {
                print(cachedResponse.data)
                print("Cache: \(compressedData)")
                let image = UIImage(data: compressedData)
                completion(image)
                return
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let cacheData = CachedURLResponse(response: response!, data: data)
            URLCache.shared.storeCachedResponse(cacheData, for: request)
                if let compressedData = UIImage(data: data)?.jpegData(compressionQuality: compressionQuality) {
                    print(data)
                    print("Download: \(compressedData)")
                        let image = UIImage(data: compressedData)
                        completion(image)
                    }
        }.resume()
    }
}
