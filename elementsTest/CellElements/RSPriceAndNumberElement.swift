//
//  PriceAndNumberElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit

class RSPriceAndNumberElement: UIView{

    @IBOutlet var contentView: UIView!
    @IBOutlet var priceView: UIView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var orderNumberLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("RSPriceAndNumberElement", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        orderNumberLabel.textColor = UIColor.astronautBlue.withAlphaComponent(0.65)
    }
    
    func setup(orderNumber: String, price: String, isPaid: Bool) {
        orderNumberLabel.text = orderNumber
        priceLabel.text = price
        priceLabel.textColor = isPaid ? UIColor.revelTextFieldTextColor : UIColor.white
        layoutIfNeeded()
        priceView.backgroundColor = isPaid ? UIColor.revelProducGreen : UIColor.revelProductRed
        priceView.layer.cornerRadius = priceView.frame.height / 2
    }
}
