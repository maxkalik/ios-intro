//
//  NetworkService.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import Foundation

final class NetworkService {

    private let apiKey = "9e464d6eb08644e3acb3efaf9e5c1ae7"
    private lazy var url: URL? = {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        urlComponents.queryItems = Configuration.queries.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        return urlComponents.url
    }()
    
    func fetchNews() async throws -> News {
        guard let url = self.url else {
            throw NetworkServiceError.endpointError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
            throw NetworkServiceError.apiError
        }
        
        guard let values = try? JSONDecoder().decode(News.self, from: data) else {
            throw NetworkServiceError.decodeError
        }
        
        guard values.articles.isEmpty == false else {
            throw NetworkServiceError.noData
        }
        
        return values
    }
}
