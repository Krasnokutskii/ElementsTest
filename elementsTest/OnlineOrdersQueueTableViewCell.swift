//
//  OnlineOrdersQueueTableViewCell.swift
//  POS
//
//  Created by Vladimir Sorokin on 17.02.2022.
//

//import RVC
import UIKit

class OnlineOrdersQueueTableViewCell: UITableViewCell {
    @IBOutlet var sourceImage: UIImageView!
    @IBOutlet var orderId: UILabel!
    @IBOutlet var priceView: UIView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var customerNameLabel: UILabel!
    @IBOutlet var vehicleInfoLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var orderTypeLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //statusLabel.textAlignment = .center
        
//        let topLabels = [customerNameLabel, timeLabel, statusLabel, orderTypeLabel]
//        let bottomLabels = [vehicleInfoLabel, dayLabel, orderId]
        
//        topLabels.forEach { $0?.textColor = UIColor.astronautBlue() }
//        bottomLabels.forEach { $0?.textColor = UIColor.astronautBlue().withAlphaComponent(0.65) }
        preservesSuperviewLayoutMargins = false //???????????????
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        if selected {
//            contentView.backgroundColor = UIColor.white
//        } else {
//            contentView.backgroundColor = RSUITheme.discountsTopMenuColor()
//        }
//    }
    
   // func setupWithOrder(_ order: OnlineOrdersQueueViewModel.Order, andImage image: UIImage?) {
 //       setupImage(image)
//        orderId.text = (order.displayId)
//        priceLabel.text = order.total
//        priceLabel.textColor = order.isPaid ? RSUIThemeCommon.textFieldTextColor() : UIColor.white
//        layoutIfNeeded()
//        priceView.backgroundColor = order.isPaid ? RSUITheme.productColorGreen() : RSUITheme.productColorRed()
//        priceView.layer.cornerRadius = priceView.frame.height / 2
//        customerNameLabel.text = order.customerName
//        if order.vehicleInfo.isEmpty {
//            vehicleInfoLabel.isHidden = true
//        } else {
//            vehicleInfoLabel.isHidden = false
//            vehicleInfoLabel.text = order.vehicleInfo
//        }
//        timeLabel.text = order.pickupTime
//        dayLabel.text = order.pickupDate
//        orderTypeLabel.text = order.orderType
//        statusLabel.text = order.statusTitle
//    }

//    func setupImage(_ image: UIImage?) {
//        if let sourceLogoImage = image {
//            sourceImage.isHidden = false
//            sourceImage.image = sourceLogoImage
//        } else {
//            sourceImage.isHidden = false
//        }
//    }
}
