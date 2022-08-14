//
//  HomeViewModel.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/13/22.
//

import Foundation

protocol HomeViewModelViewDelegate: AnyObject {
    func homeViewModelNewsDidFetch()
    func homeViewModelDidRecieveError(_ errorMsg: String)
    func homeViewModelShouldShowLoading(_ isLoading: Bool)
}

enum NetworkServiceError: Error {
    case apiError
    case endpointError
    case noData
    case decodeError
    case error(Error)
    
    var message: String {
        switch self {
        case .apiError:
            return "Something wrong with API"
        case .endpointError:
            return "Something wrong with endpoint"
        case .noData:
            return "No data"
        case .decodeError:
            return "Bad decoding"
        case .error(let error):
            return error.localizedDescription
        }
    }
}

class HomeViewModel {

    weak var viewDelegate: HomeViewModelViewDelegate?

    private let apiKey = "9e464d6eb08644e3acb3efaf9e5c1ae7"
    private lazy var url: URL? = {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        // urlComponents.path = "/v2/top-headlines"
        urlComponents.path = "/v2/everything"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: "apple"),
            URLQueryItem(name: "from", value: "2022-08-13"),
            URLQueryItem(name: "sortBy", value: "popularity"),
//            URLQueryItem(name: "country", value: "us"),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        return urlComponents.url
    }()
    
    
    var articles: [Article] = []
    
    var numberOfRows: Int {
        articles.count
    }
    
    var title: String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL d"
        return "News • " + dateFormatter.string(from: now)
    }
    
    func fetchNews(url: URL?, completion: @escaping (Result<News, NetworkServiceError>) -> Void) {
        guard let url = url else {
            completion(.failure(.endpointError))
            return
        }
        
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
    
    func getNews() {
        viewDelegate?.homeViewModelShouldShowLoading(true)
        
        fetchNews(url: self.url) { result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case .success(let news):
                    self.articles = news.articles
                    self.viewDelegate?.homeViewModelNewsDidFetch()
                    self.viewDelegate?.homeViewModelShouldShowLoading(false)
                case .failure(let error):
                    self.viewDelegate?.homeViewModelDidRecieveError(error.message)
                    self.viewDelegate?.homeViewModelShouldShowLoading(false)
                }
            }
        }
    }
    
    func article(at index: Int) -> Article? {
        articles.indices.contains(index) ? articles[index] : nil
    }
    
    func didSelectArticle(at index: Int) {
        print(articles[index])
    }
}
