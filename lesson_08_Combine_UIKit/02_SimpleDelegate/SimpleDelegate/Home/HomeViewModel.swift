//
//  HomeViewModel.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 3/4/23.
//

import Foundation
import Combine

class HomeViewModel {
    
    private lazy var disposeBag: [AnyCancellable] = []
    @Published private(set) var buttonTitle: String = "Sign In"
    @Published private(set) var shouldPresentLoginController: Bool = false
    @Published private(set) var greetingLabelText: String = ""
    
    lazy var loginViewModel: LoginViewModel = LoginViewModel()

    func mainButtonTap() {
        shouldPresentLoginController = true
        startSubscribtions()
    }
    
    private func startSubscribtions() {
        loginViewModel.emailSubject
            .sink {
                self.buttonTitle = "Logout"
                self.shouldPresentLoginController = false
                self.greetingLabelText = "Welcome \($0)"
            }
            .store(in: &disposeBag)
    }
}
