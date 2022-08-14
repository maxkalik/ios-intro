//
//  Coordiantor.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/14/22.
//

import UIKit

public protocol Coordinator: AnyObject {

    var navigationController: UINavigationController? { get }

    func start()
    func didFinish()
}

public extension Coordinator {
    func didFinish() {
        navigationController?.popViewController(animated: true)
    }
}
