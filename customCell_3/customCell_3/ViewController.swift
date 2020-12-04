//
//  ViewController.swift
//  customCell_3
//
//  Created by nick on 12/4/20.
//

import UIKit

struct Item {
  var id: Int
  var name: String
}

class ViewController: UIViewController {

    private var items: [Item] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<4 {
          items.append(Item(id: i, name: "Item \(i)"))
        }

        tableView.register(CustomTableViewCell.loadNib(),
                           forCellReuseIdentifier: CustomTableViewCell.identifier)
        
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CustomTableViewCell.height()
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                       for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = items[indexPath.row].name
        
        return cell
    }

}

