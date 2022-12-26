//
//  ListCell.swift
//  TableViewExample
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit
import Combine

final class ListCell: UITableViewCell {
    
    static let identifier: String = "ListCell"
    
    // Except delegate - Passthrough Subject
    let action = PassthroughSubject<String, Never>()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View", for: .normal)
        button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor),

            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
    @objc private func onButtonTap() {
        guard let title = titleLabel.text else { return }
        action.send(title)
    }
}
