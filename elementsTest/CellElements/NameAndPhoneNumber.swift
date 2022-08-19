//
//  NameAndPhoneNumber.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 17.8.22..
//

import UIKit

class NameAndPhoneNumber: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("NameAndPhoneNumber", owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        nameLabel.textColor = UIColor.astronautBlue
        phoneNumberLabel.textColor = UIColor.astronautBlue.withAlphaComponent(0.65)
    }
    
    func setup(name: String, phoneNumber: String) {
        nameLabel.text = name
        phoneNumberLabel.text = phoneNumber
    }

}
