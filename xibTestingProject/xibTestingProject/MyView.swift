//
//  MyView.swift
//  xibTestingProject
//
//  Created by nick on 11/27/20.
//

import UIKit

class MyView: UIView {

    @IBOutlet weak var textLabelTest: UILabel!
    
    @IBInspectable var textLabelHere: String {
        get {
            return textLabelTest.text!
        }
        
        set(textLabelHere) {
            textLabelTest.text = textLabelHere
        }
    }
    
    var view: UIView!
    var nibName: String = "MyView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setup() {
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }

}
