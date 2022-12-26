//
//  NetworkService.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import Foundation

final class NetworkService {

    var mainColor: String? {
        get {
            UserDefaults.standard.string(forKey: "MAIN_COLOR")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "MAIN_COLOR")
        }
    }
    
    private lazy var url: URL? = {
        var urlComponents = URLComponents()
        urlComponents.scheme = Configuration.scheme
        urlComponents.host = Configuration.host
        urlComponents.path = Configuration.path
        urlComponents.queryItems = Configuration.queries.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        urlComponents.setApiKey(apiKey)
        return urlComponents.url
    }()
    
    private var request: URLRequest {
        guard let url = self.url else {
            fatalError("Cannot formulate URL")
        }
        var urlRequest = URLRequest(url: url)
//        urlRequest.allHTTPHeaderFields = ["Authorization": "BearerToken"]
        urlRequest.setValue("Token", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
//    private var apiKey: String {
//        guard let filePath = Bundle.main.path(forResource: "NewsAPI-Info", ofType: "plist") else {
//            fatalError("Couldn't find file 'NewsAPI-Info.plist'")
//        }
//
//        let plist = NSDictionary(contentsOfFile: filePath)
//        guard let value = plist?.object(forKey: "API_KEY") as? String else {
//            fatalError("Couldn't find ket 'API_KEY' in file 'NewsAPI-Info.plist'")
//        }
//        return value
//    }
    
    private var apiKey: String {
        guard let fileUrl = Bundle.main.url(forResource: "NewsAPI-Info", withExtension: "plist") else {
            fatalError("Couldn't find file 'NewsAPI-Info.plist'")
        }
        do {
            let data = try Data(contentsOf: fileUrl)
            guard let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any] else {
                fatalError("Couldn't serialize file 'NewsAPI-Info.plist'")
            }

            guard let value = plist["API_KEY"] as? String else {
                fatalError("Couldn't find ket 'API_KEY' in file 'NewsAPI-Info.plist'")
            }
            return value
        } catch {
            fatalError("Couldn't serialize file 'NewsAPI-Info.plist'")
        }
    }
    
//    private var apiKey: String {
//        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
//            fatalError("Couldn't find file 'NewsAPI-Info.plist'")
//        }
//        return apiKey
//    }
    
    func fetchNews() async throws -> News {

//        mainColor = "RED"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        // let (data, response) = try await URLSession.shared.upload(for: request, from: Data())
        
        
        //        guard let url = self.url else {
        //            throw NetworkServiceError.endpointError
        //        }

        //        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpUrlResponse = response as? HTTPURLResponse else {
            throw NetworkServiceError.apiError
        }

        // [AnyHashable : Any] << check header fields in response
        // httpUrlResponse.allHeaderFields
        
        guard 200..<299 ~= httpUrlResponse.statusCode else {
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

extension URLComponents {
    mutating func setApiKey(_ apiKey: String) {
        queryItems?.append(
            URLQueryItem(name: "apiKey", value: apiKey)
        )
    }
}
