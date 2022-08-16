//
//  UniversalTableViewCell.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 15.8.22..
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        view.backgroundColor = .purple
//        stackView.addArrangedSubview(view)
        //setup()
        
    }
    func setup(){
        
        let imageView =  ImageViewElement()
        imageView.setupImage(UIImage(systemName: "pencil"))
        imageView.preferredWidth = 82
        let priceView = PriceAndNumberElement()
        priceView.setup(orderNumber: "8989898", price: "33.99", isPaid: true)
        priceView.preferredWidth = 102
        let customerInfo = CustomerInfoElement()
        customerInfo.setup(customerName: "Andry", vehicleInfo: "BMW")
        customerInfo.preferredWidth = 166
        let orderDueView = OrderDueElement()
        orderDueView.setup(pickupTime: "17:30", pickupDate: "21.07.22")
        orderDueView.preferredWidth = 126
        let orderTypeView = OrderTypeElement()
        orderTypeView.setup(orderType: "Delivery")
        let statusView = StatusElement()
        statusView.setup(status: "Waiting")
        statusView.preferredWidth = 126
        let allViews = [imageView, priceView, customerInfo, orderDueView ,orderTypeView ,statusView]
        
        createStackView(with: allViews)
    }
    
    private func createStackView(with elements: [UIView]){
        let stackView = UIStackView(arrangedSubviews: elements)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fill
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        for element in allViews{
//            element.translatesAutoresizingMaskIntoConstraints = false
//            myOwnStackView.addArrangedSubview(element)
//        }
        for index in stackView.arrangedSubviews.indices{
//            guard let widthableView = stackView.arrangedSubviews[index] as? Widthable,
//                  let preferredWidth = widthableView.preferredWidth else{
//                return
//            }
            //let multiplier = preferredWidth/(contentView.frame.size.width - 20)
            stackView.arrangedSubviews[index].widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.16).isActive = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
        if selected {
            contentView.backgroundColor = UIColor.white
        } else {
            contentView.backgroundColor = UIColor.discountPlaceholderColor.withAlphaComponent(0.65)
        }
    }
    
}

protocol Widthable{
    var preferredWidth: CGFloat? {get set}
}
