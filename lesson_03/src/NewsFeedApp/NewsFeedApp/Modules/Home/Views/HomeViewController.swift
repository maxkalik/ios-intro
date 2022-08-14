//
//  ViewController.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/13/22.
//

import UIKit

final class HomeViewController: UIViewController {

    var viewModel: HomeViewModel
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        return activityIndicatorView
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.viewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
        viewModel.getNews()
    }
}

// MARK: - Setup Views

extension HomeViewController {
    func setupViews() {
        setupNavigationBar()
        
        view.addSubview(tableView)
        view.addSubview(activityIndicatorView)
    }
    
    func setupNavigationBar() {
        title = viewModel.title
        
        navigationController?.navigationBar.prefersLargeTitles = true
        guard let titleTextFont = UIFont.titleFontSize(size: 17),
              let largeTitleTextFoont = UIFont.titleFontSize(size: 34) else { return }
        navigationController?.navigationBar.titleTextAttributes = [.font: titleTextFont]
        navigationController?.navigationBar.largeTitleTextAttributes = [.font: largeTitleTextFoont]
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    // Make height of the row based on content
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell,
           let article = viewModel.articleCell(at: indexPath.row) {
            cell.configure(viewModel: article)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectArticle(at: indexPath.row)
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
    
    func homeViewModelShouldShowLoading(_ isLoading: Bool) {
        if isLoading {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
