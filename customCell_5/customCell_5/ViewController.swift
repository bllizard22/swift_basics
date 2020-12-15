//
//  ViewController.swift
//  customCell_5
//
//  Created by Nikolay Kryuchkov on 07.12.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var cardTableView: UITableView!
    
    var cards: [String] = ["First", "Second", "Third", "Fourth"]
    override func viewDidLoad() {
        super.viewDidLoad()

//        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//        let barHeight: CGFloat =
        let barHeight: CGFloat = view.safeAreaInsets.top
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        cardTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        cardTableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "cardTableViewCell")
        cardTableView.dataSource = self
        cardTableView.delegate = self
        cardTableView.rowHeight = 200
        view.addSubview(cardTableView)
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardTableViewCell", for: indexPath as IndexPath) as! CardTableViewCell
//        cell.textLabel!.text = "\(cards[indexPath.row])"
        cell.cellLabel?.text = "\(cards[indexPath.row])"
        cell.cellLabel.font = cell.cellLabel.font.withSize(24)
//        cell.contentView.frame.size.height = 200
        cell.contentView.bounds.size.height = 200
        
//        cell.contentView.backgroundColor = .green
        return cell
    }

}

