//
//  SuperUniversalCell.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 19.8.22..
//

import UIKit

class SuperUniversalCell: RSUniversalTableViewCell{
    override func awakeFromNib() {
    }
    override func setup(with views: [UIView]) {
        super.setup(with: views)
        stackView.backgroundColor = .cyan
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        contentView.backgroundColor =  selected ? UIColor.red : UIColor.cyan
    }
}
