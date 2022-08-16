//
//  OrderTypeElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit

class OrderTypeElement: UIView, Widthable{
    var preferredWidth: CGFloat?
    

    @IBOutlet var orderTypeLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("OrderTypeElement", owner: self)
        addSubview(orderTypeLabel)
        orderTypeLabel.frame = self.bounds
        orderTypeLabel.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        orderTypeLabel.textColor = UIColor.astronautBlue
    }
    
    func setup(orderType: String) {
        orderTypeLabel.text = orderType
    }

}
