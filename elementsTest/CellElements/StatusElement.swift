//
//  StatusElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit

class StatusElement: UIView, Widthable{
    var preferredWidth: CGFloat?
    

    @IBOutlet var statusLabel: UILabel!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("StatusElement", owner: self)
        addSubview(statusLabel)
        statusLabel.frame = self.bounds
        statusLabel.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        statusLabel.textColor = UIColor.astronautBlue
        statusLabel.textAlignment = .center
    }
    
    func setup(status: String) {
        statusLabel.text = status
    }

}
