//
//  CustomTableViewCell.swift
//  customCell_5
//
//  Created by nick on 12/15/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBInspectable @IBOutlet weak var photoImage: UIImageView!
    
    @IBInspectable @IBOutlet weak var priceLabel: UILabel!
    @IBInspectable @IBOutlet weak var specsLabel: UILabel!
    @IBInspectable @IBOutlet weak var locationInfoLabel: UILabel!
    @IBInspectable @IBOutlet weak var addressLabel: UILabel!
    
    @IBInspectable @IBOutlet weak var likeButton: UIButton!
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        cellLabel.leadingAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.leadingAnchor)!).isActive = true
//        self.contentView.backgroundColor = .green
//        self.contentView.autoresizingMask = .flexibleHeight
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
