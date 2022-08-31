//
//  someSpecific.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 19.8.22..
//

import UIKit

class SpecificViewElement: RSPriceAndNumberElement{
    
    override func setup(orderNumber: String, price: String, isPaid: Bool) {
        orderNumberLabel.text = orderNumber
        priceLabel.text = price
        priceView.backgroundColor = isPaid ? UIColor.cyan : UIColor.orange
        priceLabel.textColor = isPaid ? UIColor.revelTextFieldTextColor : UIColor.white
        layoutIfNeeded()
        priceView.layer.cornerRadius = priceView.frame.height / 2
    }
}


