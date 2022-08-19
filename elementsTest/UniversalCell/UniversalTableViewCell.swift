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
//        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
//        layoutMargins = UIEdgeInsets.zero
        //add margins from left and right to stack view
    }
    
    func setupCell(elements: [RSCellElement], with order: OrderProtocol){
        var allViews = [UIView]()
        
        for element in elements{
            switch element {
            case .imageView(let preferredWidth):
                let imageView =  ImageViewElement()
                imageView.setupImage(order.sourceImage)
                imageView.preferredWidth = preferredWidth
                allViews.append(imageView)
                break
            case .priceAndNumberView(let preferredWidth):
                let priceAndNumberView = PriceAndNumberElement()
                priceAndNumberView.preferredWidth = preferredWidth
                priceAndNumberView.setup(orderNumber: order.displayId, price: order.total, isPaid: order.isPaid)
                allViews.append(priceAndNumberView)
                break
            case .customerInfoView(let preferredWidth):
                let customerInfoView = CustomerInfoElement()
                customerInfoView.preferredWidth = preferredWidth
                customerInfoView.setup(customerName: order.customerName, vehicleInfo: order.vehicleInfo)
                allViews.append(customerInfoView)
                break
            case .orderDueView(let preferredWidth):
                let orderDueView = OrderDueElement()
                orderDueView.preferredWidth = preferredWidth
                orderDueView.setup(pickupTime: order.pickupTime, pickupDate: order.pickupDate)
                allViews.append(orderDueView)
                break
            case .orderTypeView(let preferredWidth):
                let orderTypeView = OrderTypeElement()
                orderTypeView.preferredWidth = preferredWidth
                orderTypeView.setup(orderType: order.orderType)
                allViews.append(orderTypeView)
                break
            case .statusView(let preferredWidth):
                let statusView = StatusElement()
                statusView.preferredWidth = preferredWidth
                statusView.setup(status: order.statusTitle)
                allViews.append(statusView)
                break
            case .numberAndItemView(let preferredWidth):
                let numberAndItemView = NumberAndItemsElement()
                numberAndItemView.preferredWidth = preferredWidth
                numberAndItemView.setup(itemsAmount: order.itemsCount, number: order.displayId)
                allViews.append(numberAndItemView)
                break
            case .nameAndPhoneView(let preferredWidth):
                let nameAndPhoneView = NameAndPhoneNumber()
                nameAndPhoneView.preferredWidth = preferredWidth
                nameAndPhoneView.setup(name: order.customerName, phoneNumber: order.phone)
                allViews.append(nameAndPhoneView)
                break
            case .itemsQtyView(let preferredWidth):
                let itemsQty = ItemsQtyElement()
                itemsQty.preferredWidth = preferredWidth
                itemsQty.setup(quantity: order.itemsCount)
                allViews.append(itemsQty)
                break
            case .timeElapsedView(let preferredWidth):
                let timeElapsedView = TimeElapsed()
                timeElapsedView.preferredWidth = preferredWidth
                timeElapsedView.setup(timeElapsed: order.timeElapsed, isOverdue: order.timeElapsedIsOverdue)
                allViews.append(timeElapsedView)
                break
            }
        }
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

        for index in stackView.arrangedSubviews.indices{
            let multiplier = calculateMultiplier(of: elements[index] as! Widthable, in: elements as! [Widthable])
            stackView.arrangedSubviews[index].widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: multiplier).isActive = true
        }
        func calculateMultiplier(of view: Widthable, in views: [Widthable])->CGFloat{
            var fullWidth: CGFloat = 0
            for tempView in views {
                fullWidth += tempView.preferredWidth ?? 0
            }
            let multiplier = (view.preferredWidth ?? 0) / fullWidth
            return multiplier
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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

enum RSCellElement{
    case imageView(CGFloat)
    case priceAndNumberView(CGFloat)
    case customerInfoView(CGFloat)
    case orderDueView(CGFloat)
    case orderTypeView(CGFloat)
    case statusView(CGFloat)
    case numberAndItemView(CGFloat)
    case nameAndPhoneView(CGFloat)
    case itemsQtyView(CGFloat)
    case timeElapsedView(CGFloat)
}

protocol OrderProtocol{
    var displayId:    String  {get set}
    var total:        String  {get set}
    var customerName: String  {get set}
    var vehicleInfo:  String? {get set}
    var pickupTime:   String  {get set}
    var pickupDate:   String  {get set}
    var orderType:    String  {get set}
    var statusTitle:  String  {get set}
    var sourceImage:  UIImage {get set}
    var timeElapsed:  String  {get set}
    var timeElapsedIsOverdue: Bool {get set}
    var itemsCount:   Int     {get set}
    var isPaid:       Bool    {get set}
    var numberOfItems:Int     {get set}
    var phone:        String  {get set}
}
