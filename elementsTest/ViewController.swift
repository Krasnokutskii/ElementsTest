//
//  ViewController.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 14.8.22..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var customCell: CustomCell = .universalOnline
 
    let orders: [Order] = TestData.orders
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // reuse identifier?
        view.backgroundColor = .systemBlue
        tableView.delegate = self
        tableView.dataSource = self
        
        let universalName = UINib(nibName: RSUniversalTableViewCell.nibName, bundle:nil)
        tableView.register(universalName, forCellReuseIdentifier: RSUniversalTableViewCell.reuseId)
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        switch customCell {
        case .universalOnline:
            customCell = .universalDriveThrough
        case .universalDriveThrough:
            customCell = .universalDoorDash
        case .universalDoorDash:
            customCell = .universalOnline
        }
        tableView.reloadData()
    }
    
}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RSUniversalTableViewCell.reuseId ,for: indexPath) as? RSUniversalTableViewCell else {
            return UITableViewCell()
        }
        var elementsArr: [RSCellElement]
        switch customCell{
        case .universalOnline:
        elementsArr = [
            .imageView(82),
            .priceAndNumberView(120),
            .customerInfoView(166),
            .orderDueView(120),
            .orderTypeView(126),
            .statusView(126)
            ]
        case .universalDriveThrough:
        elementsArr = [
            .priceAndNumberView(136),
            .timeElapsedView(136),
            .itemsQtyView(50),
            .customerInfoView(160),
            .statusView(136)
        ]
        case .universalDoorDash:
            elementsArr = [
                .numberAndItemView(120),
                .nameAndPhoneView(166),
                .orderDueView(120),
                .statusView(166)
            ]
        }
        cell.setupCell(elements: elementsArr, with: orders[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
}


enum CustomCell{
    case universalOnline
    case universalDriveThrough
    case universalDoorDash
}

struct Order: OrderProtocol{
    var displayId: String
    
    var total: String
    
    var customerName: String
    
    var vehicleInfo: String?
    
    var pickupTime: String
    
    var pickupDate: String
    
    var orderType: String
    
    var statusTitle: String
    
    var sourceImage: UIImage
    
    var timeElapsed: String
    
    var timeElapsedIsOverdue: Bool
    
    var itemsCount: Int
    
    var isPaid: Bool
    
    var numberOfItems: Int
    
    var phone: String
}

struct TestData{
    static let orders: [Order] = [
        Order(displayId: "123456",
              total: "$33.50",
              customerName: "Frodo Begins",
              vehicleInfo: "BMW x3",
              pickupTime: "13:30",
              pickupDate: "Today",
              orderType: "AirTag del",
              statusTitle: "Cancelled",
              sourceImage: UIImage(systemName: "airtag")!,
              timeElapsed: "3:42",
              timeElapsedIsOverdue: false,
              itemsCount: 5,
              isPaid: true,
              numberOfItems: 4,
              phone: "8-800-555-35-35"),
        Order(displayId: "123457",
              total: "$33.50",
              customerName: "Frodo Begins",
              vehicleInfo: nil,
              pickupTime: "13:30",
              pickupDate: "Today",
              orderType: "Pickup",
              statusTitle: "Ready",
              sourceImage: UIImage(systemName: "globe.europe.africa.fill")!,
              timeElapsed: "3:42",
              timeElapsedIsOverdue: false,
              itemsCount: 3,
              isPaid: false,
              numberOfItems: 4,
              phone: "8-800-555-35-35"),
        Order(displayId: "123458",
              total: "$33.50",
              customerName: "Frodo Begins",
              vehicleInfo: "BMW x3",
              pickupTime: "13:30",
              pickupDate: "Today",
              orderType: "Delivery",
              statusTitle: "Waiting",
              sourceImage: UIImage(systemName: "airplane")!,
              timeElapsed: "7:53",
              timeElapsedIsOverdue: true,
              itemsCount: 3,
              isPaid: true,
              numberOfItems: 4,
              phone: "8-800-555-35-35")
        ]
}
