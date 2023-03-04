//
//  ViewController.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    private let viewModel: HomeViewModel = HomeViewModel()
    private lazy var disposeBag: [AnyCancellable] = []
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(viewModel.buttonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupSubscribtions()
    }
    
    func setupViews() {
        view.addSubview(mainButton)
        view.addSubview(greetingLabel)
        
        NSLayoutConstraint.activate([
            mainButton.widthAnchor.constraint(equalToConstant: 150),
            mainButton.heightAnchor.constraint(equalToConstant: 50),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -20)
        ])
    }
    
    func setupSubscribtions() {
        mainButton.publisher(for: .touchUpInside)
            .sink { _ in self.viewModel.mainButtonTap() }
            .store(in: &disposeBag)
        
        viewModel.$greetingLabelText
            .receive(on: DispatchQueue.main)
            .compactMap { $0 }
            .assign(to: \.text, on: greetingLabel)
            .store(in: &disposeBag)
        
        receiveAndStore(viewModel.$buttonTitle) { title in
            self.mainButton.setTitle(title, for: .normal)
        }
        
        receiveAndStore(viewModel.$shouldPresentLoginController) { isPresented in
            guard isPresented else { return }
            var viewController = LoginViewController(viewModel: self.viewModel.loginViewModel)
            self.present(viewController, animated: true)
        }
    }
    
    private func receiveAndStore<T: Any>(_ publisher: Published<T>.Publisher, getValue: @escaping (T) -> Void) {
        publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard self != nil else { return }
                getValue(value)
            }
            .store(in: &disposeBag)
    }
}

