//
//  ViewController.swift
//  randomApp
//
//  Created by Nikolay Kryuchkov on 23.11.2020.
//

import UIKit

class ViewController: UIViewController {

    var pickerData: [String] = [String]()
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickerData.delegate = self
        self.pickerData.dataSource = self
        
        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    }


}

