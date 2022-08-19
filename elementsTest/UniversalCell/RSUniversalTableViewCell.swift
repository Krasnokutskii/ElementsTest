//
//  UniversalTableViewCell.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit
protocol ElementCustomisable{
    var elements: [UIView] { get set }
}

class RSUniversalTableViewCell: UITableViewCell, ElementCustomisable{

    static let reuseId = "RSUniversalTableViewCell"
    static let nibName = "RSUniversalTableViewCell"
    
    var elements: [UIView] = []
    var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset = UIEdgeInsets.zero
    }
    
    func setup(with views: [UIView]){
        self.elements = views
        initializeStackView()
    }
    func initializeStackView(){
        stackView = UIStackView(arrangedSubviews: elements)
        setupStackView(stackView: stackView)

        for index in stackView.arrangedSubviews.indices{
            let multiplier = calculateMultiplier(of: elements[index], in: elements)
            stackView.arrangedSubviews[index].widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: multiplier).isActive = true
        }
        
        func calculateMultiplier(of view: UIView, in views: [UIView])->CGFloat{
            let fullWidth: CGFloat = views.reduce(0){$0 + $1.frame.width}
            return (view.frame.width)/fullWidth
        }
    }
    
    private func setupStackView(stackView: UIStackView){
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = UIColor.white
        } else {
            contentView.backgroundColor = UIColor.discountPlaceholderColor.withAlphaComponent(0.65)
        }
    }
    
    override func prepareForReuse() {
        for reusedView in contentView.subviews{
            reusedView.removeFromSuperview()
        }
    }
    
}
