//
//  DoorDashQueueTableViewCell.swift
//  POS
//
//  Created by Srdjan Dobrota on 16.6.21..
//

//import RVC
import UIKit

class DoorDashQueueTableViewCell: UITableViewCell {
    @IBOutlet var orderIDLabel: UILabel!
    @IBOutlet var numberOfItemsLabel: UILabel!
    @IBOutlet var customerCallNameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var pickupDateLabel: UILabel!
    @IBOutlet var pickupTimeLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        statusLabel.textAlignment = .center
        
        let topLabels = [orderIDLabel, customerCallNameLabel, pickupTimeLabel, statusLabel]
        let bottomLabels = [numberOfItemsLabel, phoneNumberLabel, pickupDateLabel]
        
        topLabels.forEach { $0?.textColor = UIColor.astronautBlue }
        bottomLabels.forEach { $0?.textColor = UIColor.astronautBlue.withAlphaComponent(0.65) }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWithOrder(_ order: Order) {
        orderIDLabel.text = order.displayId
        numberOfItemsLabel.text = "\(order.numberOfItems)" + (order.numberOfItems > 0 ? order.numberOfItems == 1 ? " item" : " items" : "")
        customerCallNameLabel.text = order.customerName
        phoneNumberLabel.text = order.phone
        statusLabel.text = order.statusTitle
        pickupDateLabel.text = order.pickupDate
        pickupDateLabel.isHidden = order.pickupDate.isEmpty
        pickupTimeLabel.text = order.pickupTime
    }
}
struct Order{
    var displayId: String
    var numberOfItems: Int
    var customerName: String
    var phone: String
    var statusTitle: String
    var pickupDate: String
    var pickupTime: String
}
