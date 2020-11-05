//
//  emojiTableViewCell.swift
//  emojiTable
//
//  Created by VM_macOS on 05.11.2020.
//  Copyright © 2020 NickolayKryuchkov. All rights reserved.
//

import UIKit

class emojiTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var decriptionLabel: UILabel!
    
    func set(object: Emoji) {
        self.emojiLabel.text = object.emoji
        self.nameLabel.text = object.name
        self.decriptionLabel.text = object.description
    }
    
}
