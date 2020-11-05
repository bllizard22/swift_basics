//
//  ViewController.swift
//  Temperature
//
//  Created by VM_macOS on 02.11.2020.
//  Copyright © 2020 NickolayKryuchkov. All rights reserved.
//

import UIKit

enum lengthUnits: String, CaseIterable {
    case km, m, cm, mm, um, nm
}

class ViewController: UIViewController {

    @IBOutlet weak var swapButton: UIButton!
    
    @IBOutlet weak var unitsSegments1: UISegmentedControl!
    @IBOutlet weak var unitsSegments2: UISegmentedControl!

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func valueDidChanged(_ sender: UITextField) {
        outputLabel.text = sender.text ?? "1.00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swapButton.layer.cornerRadius = 10
        swapButton.layer.borderWidth = 2
        swapButton.layer.borderColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0).cgColor
        
        unitsSegments1.selectedSegmentIndex = 0
        unitsSegments1.insertSegment(withTitle: "mile", at: 1, animated: false)
        unitsSegments1.removeAllSegments()
        
        //let lengthUnitsCount = lengthUnits.allCases.count
        for unit in lengthUnits.allCases {
            if unit.rawValue != "um" {
                unitsSegments1.insertSegment(withTitle: unit.rawValue, at: lengthUnits.allCases.count, animated: false)
            } else {
                unitsSegments1.insertSegment(withTitle: "µm", at: lengthUnits.allCases.count, animated: false)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    


}

