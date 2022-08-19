//
//  ItemsQtyElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 17.8.22..
//

import UIKit

class ItemsQtyElement: UIView, Widthable{
    var preferredWidth: CGFloat?
    

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
        Bundle.main.loadNibNamed("ItemsQtyElement", owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        itemsQty.textColor = UIColor.revelTextColor
    }
    
    func setup(quantity: Int){
        itemsQty.text = "\(quantity)"
    }
}
