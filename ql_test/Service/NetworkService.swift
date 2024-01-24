//
//  NetworkService.swift
//  ql_test
//
//  Created by Максим Сизов on 22.01.2024.
//

import Foundation
import Apollo

class NetworkService {
    
    static let shared = NetworkService()
    
    private(set) var apollo = ApolloClient(url: URL(string: "https://api.pomosch.app/graphql")!)
    
    private init () {}
    
}
