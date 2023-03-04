//
//  LoginViewController.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit
import Combine

final class LoginViewController: UIViewController {

    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let action = PassthroughSubject<String, Never>()
    @Published var shouldShowWelcomeLabel: Bool = true
    
    deinit {
        print("DEINIT", self)
    }
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = viewModel.emailPlaceholder
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(viewModel.loginButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var disposeBag: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupSubscribtions()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(emailTextField)
        view.addSubview(loginButton)

        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20)
        ])
    }

    func setupSubscribtions() {
        viewModel.$shouldShowLoginButton
            .assign(to: \.isEnabled, on: loginButton)
            .store(in: &disposeBag)
        
        emailTextField.textPublisher
            .sink { self.viewModel.emailDidChange($0) }
            .store(in: &disposeBag)
        
        loginButton.publisher(for: .touchUpInside)
            .sink { _ in self.viewModel.loginButtonTap() }
            .store(in: &disposeBag)
        
        viewModel.$shouldPresentAlert
            .sink { alert in
                guard let alert = alert else { return }
                self.presentAlert(title: alert.title, message: alert.message)
            }
            .store(in: &disposeBag)
        
        viewModel.$shouldDismiss
            .sink { isDismissed in
                guard isDismissed else { return }
                self.dismiss(animated: true)
            }
            .store(in: &disposeBag)
    }
    
    private func presentAlert(title: String, message: String) {
        presentAlert(title: title, message: message) {
            self.viewModel.alertButtonTap()
        }
    }
}
