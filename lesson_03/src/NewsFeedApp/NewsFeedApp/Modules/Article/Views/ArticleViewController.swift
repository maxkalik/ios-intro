//
//  ArticleViewController.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/14/22.
//

import UIKit

final class ArticleViewController: UIViewController {
    
    private var viewModel: ArticleViewModel
    
    init(viewModel: ArticleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("Deinit \(self)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: viewModel.rightBarButtonTitle,
            style: .plain,
            target: self,
            action: #selector(rightBarButtonTap)
        )
    }
    
    @objc
    func rightBarButtonTap() {
        viewModel.rightBarButtonTap()
    }
}
