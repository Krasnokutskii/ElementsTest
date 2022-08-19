//
//  SuperUniversalCell.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 19.8.22..
//

import UIKit

class SuperUniversalCell: RSUniversalTableViewCell{
    override func setup(with views: [UIView]) {
        views[0].frame.size.width = 400
        super.setup(with: views)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        contentView.backgroundColor =  selected ? UIColor.red : UIColor.cyan
    }
}
