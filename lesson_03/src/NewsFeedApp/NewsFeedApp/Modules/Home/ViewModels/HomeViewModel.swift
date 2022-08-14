//
//  HomeViewModel.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/13/22.
//

import Foundation

// MARK: - Protocol

protocol HomeViewModel {
    var viewDelegate: HomeViewModelViewDelegate? { get set }
    var numberOfRows: Int { get }
    var title: String { get }
    
    func getNews()
    func articleCell(at index: Int) -> ArticleCellViewModel?
    func didSelectArticle(at index: Int)
}

// MARK: - Delegates

protocol HomeViewModelViewDelegate: AnyObject {
    func homeViewModelNewsDidFetch()
    func homeViewModelDidRecieveError(_ errorMsg: String)
    func homeViewModelShouldShowLoading(_ isLoading: Bool)
}

protocol HomeViewModelCoordinatorDelegate: Coordinator {
    func homeViewModelShowArticle(_ article: Article)
}

// MARK: - Implementation

final class HomeViewModelImplementation: HomeViewModel {

    weak var viewDelegate: HomeViewModelViewDelegate?
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    
    private lazy var networkService = NetworkService()
    private var articles: [Article] = []
    
    var numberOfRows: Int {
        articles.count
    }
    
    var title: String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL d"
        return "News • " + dateFormatter.string(from: now)
    }

    func getNews() {
        viewDelegate?.homeViewModelShouldShowLoading(true)
        
        networkService.fetchNews { result in
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
    
    func articleCell(at index: Int) -> ArticleCellViewModel? {
        guard let article = article(at: index) else {
            return nil
        }
        return ArticleCellViewModelImplementation(model: article)
    }
    
    func didSelectArticle(at index: Int) {
        guard let article = article(at: index) else {
            viewDelegate?.homeViewModelDidRecieveError("Cannot open article. Something went wrong")
            return
        }
        coordinatorDelegate?.homeViewModelShowArticle(article)
    }
}
