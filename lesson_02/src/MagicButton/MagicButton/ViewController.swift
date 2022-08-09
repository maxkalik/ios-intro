//
//  ViewController.swift
//  MagicButton
//
//  Created by Maksim Kalik on 8/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let magicButton = UIButton(type: .system)
        magicButton.setTitle("Magic Button", for: .normal)
        magicButton.backgroundColor = .white
        magicButton.translatesAutoresizingMaskIntoConstraints = false
        magicButton.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        view.addSubview(magicButton)
        
        NSLayoutConstraint.activate([
            magicButton.widthAnchor.constraint(equalToConstant: 150),
            magicButton.heightAnchor.constraint(equalToConstant: 50),
            magicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            magicButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    func onTap() {
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
}

