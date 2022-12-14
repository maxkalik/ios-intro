//
//  ViewController.swift
//  TableViewExample
//
//  Created by Maksim Kalik on 8/10/22.
//

import UIKit
var list: [String] = "POET GESTURAL VILLAGE COLOSSAL FINANCIAL ABERRANT ABATTOIR LONER HOMICIDE FAMILY STEEL BARNBURNER PROMISED GOOD-BYE PICNIC CALLOUS CLIMAX SUPERFICIAL TRITE BRUSH LOSS BEEKEEPER ELFIN AUNT DISCLOSURE BLUSHING COWARDLY UNCOVERED DAUGHTER HOOLIGAN FALLACIOUS BLUEPRINT ACHE PUSHY RACKET COSTUMED ARMS EASTERN SPEND GIVE INNER CROOKED MAJESTIC DIAMETRIC MATURE REST PARTICIPATE MIGRATE DESCRIPTION COAL MOW MOLTEN BLINDING GUTS DETAILS EGGS RECALL FRIGHTENING UNSUITABLE REMARKABLE LAMP WATER FUSE PRESERVE SIGN DISTURBANCE SADDLE RUTHLESS GODLESS DASHING UGLY XENOPHOBIC UNADVISED OPERATE FIREARM ASHES ILLEGAL MOTH PITY AGONIZING ABSENCE TWO BLEAKNESS CINNAMON HACK HIRSUTE SILENT CASE NERVE ETERNITY DISTORT THRONE ABIDE CLUBFOOT CURSED DISTANCE COMET OVERT SERUM CRUCIFIER"
        .components(separatedBy: " ")

class ViewController: UIViewController {

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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        
        if position > (scrollView.contentSize.height - listTableView.frame.size.height) {
            print("***** load data")
        }
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
