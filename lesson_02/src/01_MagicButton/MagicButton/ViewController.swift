//
//  ViewController.swift
//  MagicButton
//
//  Created by Maksim Kalik on 8/9/22.
//

import UIKit

class ViewController: UIViewController {
    

//    let words: [String] = ["xcode", "ios", "playground", "iphone", "ipdad", "device"]
    
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
        
//        let wordLabel = UILabel()
//        wordLabel.text = words.randomElement()
//        wordLabel.textColor = .white
//        wordLabel.font = .systemFont(ofSize: 24, weight: .bold)
//        wordLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(wordLabel)
//
//        NSLayoutConstraint.activate([
//            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            wordLabel.bottomAnchor.constraint(equalTo: magicButton.topAnchor, constant: -20)
//        ])
        
        changeBackgroundColor()
    }
    
    @objc
    func onTap() {
        changeBackgroundColor()
//        wordLabel.text = words.randomElement()
    }
    
    func changeBackgroundColor() {
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
}

