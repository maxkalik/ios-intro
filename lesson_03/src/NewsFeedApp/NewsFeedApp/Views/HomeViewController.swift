//
//  ViewController.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/13/22.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var viewModel = HomeViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)

        viewModel.viewDelegate = self
        viewModel.getNews()
        
        setupConstrains()
    }
}

// MARK - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    // Make height of the row based on content
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell {
            cell.configure(article: viewModel.articles[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - HomeViewModelViewDelegate

extension HomeViewController: HomeViewModelViewDelegate {
    func homeViewModelNewsDidFetch() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func homeViewModelDidRecieveError(_ errorMsg: String) {
        let alert = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - Constrains

extension HomeViewController {
    func setupConstrains() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
