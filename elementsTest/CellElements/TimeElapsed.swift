//
//  TimeElapsed.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 18.8.22..
//

import UIKit

class TimeElapsed: UIView, Widthable{
    var preferredWidth: CGFloat?
    
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
    
    func setup(timeElapsed: String, isOverdue: Bool){
        timeElapsedLabel.text = "\(timeElapsed)"
        if isOverdue {
            timeElapsedLabel.textColor = UIColor.revelProductRed
        }
    }

}
