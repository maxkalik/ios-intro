//
//  ViewController.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/13/22.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var viewModel = HomeViewModel()
    
    lazy var listTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "News"
        title
        
        view.addSubview(listTableView)
        
        listTableView.delegate = self
        listTableView.dataSource = self

        listTableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.identifier)
        
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
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell {
            cell.configure(article: viewModel.news[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - Constrains

extension HomeViewController {
    func setupConstrains() {
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.topAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
