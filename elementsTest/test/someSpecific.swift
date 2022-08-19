//
//  someSpecific.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 19.8.22..
//

import UIKit

class SpecificViewElement: PriceAndNumberElement{
    
    override func setup(orderNumber: String, price: String, isPaid: Bool) {
        orderNumberLabel.text = orderNumber + "  1"
        priceLabel.text = price
        priceView.backgroundColor = isPaid ? UIColor.cyan : UIColor.orange
        priceLabel.textColor = isPaid ? UIColor.revelTextColor : UIColor.white
        layoutIfNeeded()
        priceView.layer.cornerRadius = priceView.frame.height / 3
    }
}

