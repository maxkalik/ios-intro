//
//  LoginViewController.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func emailLoginDidSuccess(_ email: String)
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    
    deinit {
        print("DEINIT", self)
    }
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@email.com"
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(confirmTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @objc
    func emailTextFieldChanged(_ sender: UITextField) {

    }
    
    @objc
    func confirmTap() {
        if let email = emailTextField.text, email.isEmpty == false {
            dismiss(animated: true)
            delegate?.emailLoginDidSuccess(email)
        } else {
            presentAlert(title: "Login Failed", message: "Please type a correct email address.")
        }
    }
}
