//
//  ItemsQtyElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 17.8.22..
//

import UIKit

class RSItemsQtyElement: UIView{

    @IBOutlet var containerView: UIView!
    @IBOutlet var itemsQty: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("RSItemsQtyElement", owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        itemsQty.textColor = UIColor.revelTextFieldTextColor
    }
    
    func setup(quantity: Int) {
        itemsQty.text = "\(quantity)"
    }
}
