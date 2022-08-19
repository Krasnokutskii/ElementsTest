//
//  NumberAndItemsElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 17.8.22..
//

import UIKit

class NumberAndItemsElement: UIView {
   
    @IBOutlet var containerView: UIView!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var itemsLabel: UILabel!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("NumberAndItemsElement", owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        numberLabel.textColor = UIColor.astronautBlue.withAlphaComponent(0.65)
        itemsLabel.textColor = UIColor.astronautBlue
    }
    
    func setup(itemsAmount: Int,number: String ) {
        itemsLabel.text = "\(itemsAmount)" + (itemsAmount > 0 ? itemsAmount == 1 ? " item" : " items" : "")
        numberLabel.text = number
    }
}
