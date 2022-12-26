//
//  NetworkService.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/14/22.
//

import Foundation

final class NetworkService {

    private let apiKey = "9e464d6eb08644e3acb3efaf9e5c1ae7"
    private lazy var url: URL? = {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
//        urlComponents.path = "/v2/top-headlines"
//        urlComponents.queryItems = [
//            URLQueryItem(name: "q", value: "apple"),
//            URLQueryItem(name: "from", value: "2022-08-13"),
//            URLQueryItem(name: "sortBy", value: "popularity"),
//            URLQueryItem(name: "country", value: "us"),
//            URLQueryItem(name: "apiKey", value: apiKey)
//        ]
        urlComponents.queryItems = Configuration.queries.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        return urlComponents.url
//        return URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-10-28&to=2022-10-28&sortBy=popularity&apiKey=9e464d6eb08644e3acb3efaf9e5c1ae7")
    }()
    
    func fetchNews(completion: @escaping (Result<News, NetworkServiceError>) -> Void) {
        guard let url = self.url else {
            completion(.failure(.endpointError))
            return
        }
        
        print(url)
        
        let session = URLSession.shared
        session.dataTask(with: url) { result in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.apiError))
                    return
                }
                
                do {
                    let values = try JSONDecoder().decode(News.self, from: data)
                    if values.articles.isEmpty {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.success(values))
                } catch {
                    debugPrint(error.localizedDescription)
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completion(.failure(.error(error)))
            }
        }
        .resume()
    }
}
