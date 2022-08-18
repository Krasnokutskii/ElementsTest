//
//  OrderDueElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit

class OrderDueElement: UIView, Widthable{
    var preferredWidth: CGFloat?
    
    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("OrderDueElement", owner: self)
        addSubview(stackView)
        stackView.frame = self.bounds
        stackView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        timeLabel.textColor = UIColor.astronautBlue
        dayLabel.textColor = UIColor.astronautBlue.withAlphaComponent(0.65)
    }
    
    func setup(pickupTime: String, pickupDate: String) {
        timeLabel.text = pickupTime
        dayLabel.text = pickupDate
    }

}