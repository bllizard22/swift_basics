//
//  TableViewCell.swift
//  xibTableCell
//
//  Created by Nikolay Kryuchkov on 02.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var customCell: UITableViewCell!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBInspectable var textLabelHere: String? {
        get {
            return cellLabel.text!
        }
        
        set(textLabelHere) {
            cellLabel.text = textLabelHere
        }
    }
    
    var view: UIView!
    var nibName: String = "TableViewCell"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
        addSubview(customCell)
        customCell.frame = self.bounds
        customCell.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
