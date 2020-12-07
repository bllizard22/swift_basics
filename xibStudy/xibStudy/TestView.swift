//
//  TestView.swift
//  xibStudy
//
//  Created by Nikolay Kryuchkov on 03.12.2020.
//

import UIKit

class TestView: UIView {

    @IBOutlet var contenView: UIView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
        addSubview(contenView)
        contenView.frame = self.bounds
        contenView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
