//
//  CardTableViewCell.swift
//  customCell_5
//
//  Created by Nikolay Kryuchkov on 07.12.2020.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBInspectable @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
