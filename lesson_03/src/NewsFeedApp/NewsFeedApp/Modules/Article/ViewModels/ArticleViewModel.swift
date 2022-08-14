//
//  ArticleViewModels.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/14/22.
//

import Foundation

// MARK: - Protocol

protocol ArticleViewModel {
    var rightBarButtonTitle: String { get }

    func rightBarButtonTap()
}

// MARK: - Delegates

protocol ArticleViewModelCoordinatorDelegate: Coordinator {

}

// MARK: - Implementation

final class ArticleViewModelImplementation: ArticleViewModel {

    weak var coordinatorDelegate: ArticleViewModelCoordinatorDelegate?
    
    private var article: Article
    
    init(article: Article) {
        self.article = article
        print(article)
    }
    
    deinit {
        print("Deinit \(self)")
    }
    
    var url: URL? {
        URL(string: article.url)
    }
    
    var rightBarButtonTitle: String = "Open in Web"
    
    func rightBarButtonTap() {
        guard let url = URL(string: article.url) else {
            // show alert if url not work
            return
        }
        coordinatorDelegate?.open(url: url)
    }
}
