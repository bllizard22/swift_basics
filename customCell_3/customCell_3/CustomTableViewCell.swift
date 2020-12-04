//
//  CustomTableViewCell.swift
//  customCell_3
//
//  Created by nick on 12/4/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
           nameLabel.textColor = UIColor.green
        }
    }
    
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
    
    override class func height() -> CGFloat {
      return 60.0
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
      if highlighted {
        alpha = 0.4
      } else {
        alpha = 1.0
      }
    }
    
}

extension UITableViewCell {

  class var identifier: String {
    return String(describing: self)
  }

  @objc
  class func height() -> CGFloat {
    return 140
  }

}

extension UIView {
  
  class func loadFromNibNamed(_ nibNamed: String, _ bundle: Bundle? = nil) -> UINib {
    return UINib(nibName: nibNamed, bundle: bundle)
  }
  
  class func loadNib() -> UINib {
    let className = String(describing: self)
    return loadFromNibNamed(className)
  }
  
}
