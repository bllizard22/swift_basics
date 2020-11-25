//
//  ViewController.swift
//  keyboardActionsHandler
//
//  Created by nick on 11/25/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
//    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textField.delegate = self
        textLabel.numberOfLines = 0
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:))
                                               , name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:))
                                               , name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:))
                                               , name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
    
    private func updateLabel() {
        guard textField.text != "" else {
            return
        }
        textLabel.text = textField.text
        textField.text = ""
    }
    
    @IBAction func buttonDidPressed(_ sender: UIButton) {
        updateLabel()
        textField.endEditing(true)
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRect.height
        }
        if notification.name == UIResponder.keyboardWillHideNotification {
            view.frame.origin.y = 0
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstRespond
        updateLabel()
        textField.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.endEditing(true)
    }


}

