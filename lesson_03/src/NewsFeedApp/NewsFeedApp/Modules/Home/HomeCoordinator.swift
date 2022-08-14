//
//  MainCoordinator.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/14/22.
//

import UIKit

protocol HomeCoordinator: Coordinator {
    
}

final class HomeCoordinatorImplementation: HomeCoordinator {

    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModelImplementation()
        viewModel.coordinatorDelegate = self
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showArticle(_ article: Article) {
        let viewModel = ArticleViewModelImplementation(article: article)
        viewModel.coordinatorDelegate = self
        let viewController = ArticleViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeViewModelCoordinatorDelegate

extension HomeCoordinatorImplementation: HomeViewModelCoordinatorDelegate {
    func homeViewModelShowArticle(_ article: Article) {
        showArticle(article)
    }
}

// MARK: - ArticleViewModelCoordinatorDelegate

extension HomeCoordinatorImplementation: ArticleViewModelCoordinatorDelegate {
    
}
