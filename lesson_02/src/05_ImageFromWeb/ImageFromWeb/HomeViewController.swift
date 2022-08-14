//
//  ViewController.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var showImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(showImageButton)
        
        NSLayoutConstraint.activate([
            showImageButton.widthAnchor.constraint(equalToConstant: 150),
            showImageButton.heightAnchor.constraint(equalToConstant: 50),
            showImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showImageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    func signInTapped() {
        // self.loginViewController.modalPresentationStyle = .fullScreen
        
        let viewController = ImageViewController()
        present(viewController, animated: true)
    }
}
