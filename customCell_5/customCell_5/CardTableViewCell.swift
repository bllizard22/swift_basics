//
//  CardTableViewCell.swift
//  customCell_5
//
//  Created by Nikolay Kryuchkov on 07.12.2020.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBInspectable @IBOutlet weak var cellLabel: UILabel!
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
//        self.contentView.backgroundColor = .green
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .green
        self.contentView.autoresizingMask = .flexibleHeight
        self.contentView.frame.size.height = 200

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
