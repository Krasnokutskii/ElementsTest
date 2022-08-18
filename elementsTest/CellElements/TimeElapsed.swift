//
//  TimeElapsed.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 18.8.22..
//

import UIKit

class TimeElapsed: UIView {
    @IBOutlet var containerView: UIView!
    @IBOutlet var timeElapsedLabel: UILabel!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("TimeElapsed", owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        timeElapsedLabel.textColor = UIColor.revelTextColor
    }
    
    func setup(quantity: Int, isOverdue: Bool){
        timeElapsedLabel.text = "\(quantity)"
        if isOverdue {
            timeElapsedLabel.textColor = UIColor.revelProductRed
        }
    }

}
