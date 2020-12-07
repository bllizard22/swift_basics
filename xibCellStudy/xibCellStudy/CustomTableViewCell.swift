//
//  CustomTableViewCell.swift
//  xibCellStudy
//
//  Created by Nikolay Kryuchkov on 03.12.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
//    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomTableViewCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
