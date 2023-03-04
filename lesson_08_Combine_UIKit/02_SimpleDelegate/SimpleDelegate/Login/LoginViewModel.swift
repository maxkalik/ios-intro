//
//  LoginViewModel.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 3/4/23.
//

import Foundation
import Combine

class LoginViewModel {
    
    private lazy var disposeBag: [AnyCancellable] = []

    private var email: String = ""
    @Published private(set) var shouldShowLoginButton: Bool = false
    @Published private(set) var shouldDismiss: Bool = false
    @Published private(set) var shouldPresentAlert: (title: String, message: String)? = nil
    
    let emailSubject = PassthroughSubject<String, Never>()
    
    let emailPlaceholder: String = "example@email.com"
    let loginButtonTitle: String = "Login"
    
    func emailDidChange(_ value: String) {
        self.shouldShowLoginButton = !value.isEmpty
        self.email = value
    }
    
    func loginButtonTap() {
        if !email.isEmpty {
            shouldDismiss = true
            emailSubject.send(email)
        } else {
            shouldPresentAlert = (title: "Login Failed", message: "Please type a correct email address.")
        }
    }
    
    func alertButtonTap() {
        shouldPresentAlert = nil
    }
}
