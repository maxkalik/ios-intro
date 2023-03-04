//
//  UIButton.swift
//  SimpleDelegate
//
//  Created by Maksim Kalik on 3/4/23.
//

import UIKit

extension UIButton {
    var titleText: String? {
        get {
            title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
}
