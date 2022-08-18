//
//  DriveThroughQueueOrdersViewControllerTableCell.swift
//  POS
//
//  Created by Artem Ivanov on 7/15/21.
//

//import RVC
import UIKit

final class DriveThroughQueueOrdersViewControllerTableCell: UITableViewCell{
    @IBOutlet var orderNumberLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceContainer: UIView!
    @IBOutlet var timeElapsedLabel: UILabel!
    @IBOutlet var itemsQtyLabel: UILabel!
    @IBOutlet var customerNameLabel: UILabel!
    @IBOutlet var customerVehicleLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    public func setup(){
        setupUI()
        //timeElapsedLabel.textColor = UIColor.revelRed
        priceLabel.textColor = UIColor.white
        priceContainer.backgroundColor = UIColor.revelProductRed
        
    }
//    public func setupCell(_ order: Order) {
//        setupUI()
//
//        orderNumberLabel.text = order.orderNumber
//        timeElapsedLabel.text = order.timeElapsed
//        if order.timeElapsedIsOverdue {
//            timeElapsedLabel.textColor = RSUITheme.productColorRed()
//        }
//        itemsQtyLabel.text = String(order.itemsCount)
//        customerNameLabel.text = order.customerName
//        customerVehicleLabel.text = order.vehicleInfo
//
//        priceLabel.text = order.total
//        priceLabel.textColor = order.isPaid ? RSUIThemeCommon.textFieldTextColor() : UIColor.white
//        priceContainer.backgroundColor = order.isPaid ? RSUITheme.productColorGreen() : RSUITheme.productColorRed()
//
//        statusLabel.text = order.orderStatusTitle
//    }
//
    private func setupUI() {
        orderNumberLabel.textColor = UIColor.revelTextColor//RSUIThemeCommon.textFieldTextColor()
        timeElapsedLabel.textColor = UIColor.revelTextColor//RSUIThemeCommon.textFieldTextColor()
        timeElapsedLabel.textColor = UIColor.revelTextColor//RSUIThemeCommon.textFieldTextColor()
        itemsQtyLabel.textColor = UIColor.revelTextColor//RSUIThemeCommon.textFieldTextColor()
        customerNameLabel.textColor = UIColor.revelTextColor//RSUIThemeCommon.textFieldTextColor()
        customerVehicleLabel.textColor = UIColor.revelTextColor//RSUIThemeCommon.textFieldTextColor()
        statusLabel.textColor = UIColor.revelTextColor//RSUIThemeCommon.textFieldTextColor()

        layoutIfNeeded()
        priceContainer.layer.cornerRadius = priceContainer.frame.height / 2
    }
}
