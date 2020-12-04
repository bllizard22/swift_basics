//
//  ViewController.swift
//  xibThirdStudy
//
//  Created by nick on 12/4/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stockTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stockTableView.register(UINib(nibName: "NameInput", bundle: nil), forCellReuseIdentifier: "Cell")
    }


}

