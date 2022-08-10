//
//  ViewController.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var loginViewController: LoginViewController = {
        let viewController = LoginViewController()
        viewController.delegate = self
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(signInButton)
        view.addSubview(greetingLabel)
        
        NSLayoutConstraint.activate([
            signInButton.widthAnchor.constraint(equalToConstant: 150),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -20)
        ])
    }
    
    @objc
    func signInTapped() {
        // self.loginViewController.modalPresentationStyle = .fullScreen
        present(self.loginViewController, animated: true)
    }
}

extension HomeViewController: LoginViewControllerDelegate {
    func emailLoginDidSuccess(_ email: String) {
        greetingLabel.text = "Welcome, \(email)"
        greetingLabel.isHidden = false
        signInButton.setTitle("Logout", for: .normal)
    }
}
