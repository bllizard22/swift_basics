//
//  NewEmojiTableViewController.swift
//  emojiTable
//
//  Created by VM_macOS on 11.11.2020.
//  Copyright © 2020 NickolayKryuchkov. All rights reserved.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {

    var saveEmoji = Emoji(emoji: "", name: "", description: "", isFavourite: false)
    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    private func textFieldsChecker() {
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    private func updateUI() {
        emojiTextField.text = saveEmoji.emoji
        nameTextField.text = saveEmoji.name
        descriptionTextField.text = saveEmoji.description
    }
    @IBAction func saveButtonObserver(_ sender: UITextField) {
        
        textFieldsChecker()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        textFieldsChecker()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else {
            return
        }
        
        let emoji = emojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        
        self.saveEmoji = Emoji(emoji: emoji, name: name, description: description, isFavourite: self.saveEmoji.isFavourite)
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    

}
