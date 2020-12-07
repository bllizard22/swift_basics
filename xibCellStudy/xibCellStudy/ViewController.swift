//
//  ViewController.swift
//  xibCellStudy
//
//  Created by Nikolay Kryuchkov on 03.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var todoItems: [String] = ["first", "second", "third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabelView()
//        self.view.backgroundColor = .systemBlue
        
    }

    private func setupTabelView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.register(nib, forCellReuseIdentifier: "cellIdentifier")
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! CustomTableViewCell
        
//        cell.titleLabel .text = todoItems[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select row at \(indexPath  )")
    }
}
