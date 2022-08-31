//
//  StatusElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit

class RSStatusElement: UIView{
    
    @IBOutlet var containerView: UIView!
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
        Bundle.main.loadNibNamed("RSStatusElement", owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        statusLabel.textColor = UIColor.astronautBlue
        statusLabel.textAlignment = .center
    }
    
    func setup(status: String) {
        statusLabel.text = status
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
    override func invalidateIntrinsicContentSize() {
        
    }
}
