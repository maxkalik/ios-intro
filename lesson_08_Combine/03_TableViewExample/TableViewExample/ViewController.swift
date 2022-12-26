//
//  ViewController.swift
//  TableViewExample
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private lazy var list: [String] = []
    private lazy var viewModel = ViewModel()
    
    private lazy var listTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // If only one observer in the class
    // private var observer: AnyCancellable?
    
    // If several observers
    private lazy var observers: [AnyCancellable] = []
    
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
        
        // MARK: - Before
        // fetchUsingClosure()
        
        // MARK: - After
        fetchUsingCombine()
    }
}

// MARK: - Fetching

extension ViewController {
    func fetchUsingClosure() {
        viewModel.fetchData { values in
            self.list = values
            self.listTableView.reloadData()
        }
    }
    
    func fetchUsingCombine() {
        // if only one observer
        // observer = viewModel.fetchData()
        viewModel.fetchData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    // handle if finished
                    break
                case .failure(let error):
                    // handle if error
                    print(error.localizedDescription)
                }
            }, receiveValue: { list in
                self.list = list
                self.listTableView.reloadData()
            })
            // if several observers
            .store(in: &observers)
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
            cell.action.sink { value in
                print("cell button tap with value:", value)
            }
            .store(in: &observers)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
