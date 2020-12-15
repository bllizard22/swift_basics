//
//  ViewController.swift
//  customCell_5
//
//  Created by Nikolay Kryuchkov on 07.12.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var navCon: UINavigationController!
    var cardTableView: UITableView!
    
    var cards: [String] = ["First", "Second", "Third", "Fourth"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = view.safeAreaInsets.bottom
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        cardTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
//        cardTableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "cardTableViewCell")
        cardTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
        cardTableView.dataSource = self
        cardTableView.delegate = self
        cardTableView.rowHeight = 290
        
//        navCon = UINavigationController()
//        navCon.viewControllers = [self]
//        navCon.title = "Title"
        
        view.addSubview(cardTableView)
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(cards[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath as IndexPath) as! CardTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath as IndexPath) as! CustomTableViewCell
//        cell.textLabel!.text = "\(cards[indexPath.row])"
//        cell.cellLabel?.text = "\(cards[indexPath.row])"
//        cell.cellLabel.font = cell.cellLabel.font.withSize(24)
        
        cell.priceLabel.text = "120 000"
        cell.priceLabel.font = cell.priceLabel.font.withSize(28)
        cell.photoImage.image = UIImage(named: "photo_\(indexPath.row+1)")
//        cell.photoImage.image = UIImage(named: "photo_2")
        cell.photoImage.layer.cornerRadius = 12
        cell.photoImage.contentMode = .scaleAspectFill
//        cell.

        return cell
    }

}

