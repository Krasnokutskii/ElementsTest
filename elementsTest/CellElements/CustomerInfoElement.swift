//
//  CustomerInfoElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit

class CustomerInfoElement: UIView, Widthable{
    var preferredWidth: CGFloat?
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var customerName: UILabel!
    @IBOutlet var vehicleInfo: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("CustomerInfoElement", owner: self)
        addSubview(stackView)
        stackView.frame = self.bounds
        stackView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        customerName.textColor = UIColor.astronautBlue //RVC
        vehicleInfo.textColor = UIColor.astronautBlue.withAlphaComponent(0.65)//RVC
        
    }
    
    func setup(customerName: String, vehicleInfo: String? = nil ) {
        self.customerName.text = customerName
        if self.vehicleInfo == nil {
            self.vehicleInfo.isHidden = true
        } else {
            self.vehicleInfo.isHidden = false
            self.vehicleInfo.text = vehicleInfo
        }
    }

}
