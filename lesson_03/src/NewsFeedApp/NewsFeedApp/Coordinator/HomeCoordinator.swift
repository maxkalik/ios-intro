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
        let viewModel = HomeViewModel()
        viewModel.coordinatorDelegate = self
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showArticle() {
        let viewController = ArticleViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeView

extension HomeCoordinatorImplementation: HomeViewModelCoordinatorDelegate {
    func homeViewModelShowArticle() {
        showArticle()
    }
}
