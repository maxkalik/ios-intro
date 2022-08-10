//
//  ViewController.swift
//  TableViewExample
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    private var list: [String] = ["xcode", "ios", "playground", "iphone", "ipdad", "device", "development", "code"]
    
    lazy var listTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(listTableView)
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        listTableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.topAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

// MARK - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}

// MARK - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as? ListCell {
            cell.configure(title: list[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
