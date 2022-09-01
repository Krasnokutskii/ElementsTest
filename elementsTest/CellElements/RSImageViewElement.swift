//
//  ImageViewElement.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit

class RSImageViewElement: UIView{
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("RSImageViewElement", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    
    func setupImage(_ image: UIImage?){
        if let sourceLogoImage = image {
            imageView.isHidden = false
            imageView.image = sourceLogoImage
        } else {
            imageView.isHidden = false
        }
    }
}
