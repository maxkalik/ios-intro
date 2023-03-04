//
//  UIViewController.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String, buttonDidTap: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            buttonDidTap?()
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}
