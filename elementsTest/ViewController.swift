//
//  ViewController.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 14.8.22..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var customCell: CustomCell = .universal
 
    let orders: [Order] = TestData.orders
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .systemBlue
        tableView.delegate = self
        tableView.dataSource = self
        
        let doorDashName = UINib(nibName: "DoorDashQueueTableViewCell", bundle:nil)
        tableView.register(doorDashName, forCellReuseIdentifier: "DoorDashQueueTableViewCell")
        let universalName = UINib(nibName: "UniversalTableViewCell", bundle:nil)
        tableView.register(universalName, forCellReuseIdentifier: "UniversalTableViewCell")
        let driveThroughName = UINib(nibName: "DriveThroughQueueOrdersViewControllerTableCell", bundle:nil)
        tableView.register(driveThroughName, forCellReuseIdentifier: "DriveThroughQueueOrdersViewControllerTableCell")
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        customCell = .doorDash
        tableView.reloadData()
    }
    
}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch customCell{
        case .universal:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalTableViewCell",for: indexPath) as? UniversalTableViewCell else {
                return UITableViewCell()
            }
            
            let elementsArr: [RSCellElement] = [
                .priceAndNumberView(100),
                .timeElapsedView(80),
                .itemsQtyView(50),
                .customerInfoView(100),
                .statusView(160)
            ]
            cell.setupCell(elements: elementsArr, with: orders[indexPath.row])
            
            return cell
        case .doorDash:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoorDashQueueTableViewCell",for: indexPath) as? DoorDashQueueTableViewCell else{
                return UITableViewCell()
            }
            //cell.setupWithOrder(Order(displayId: "124354", numberOfItems: 3, customerName: "Jhon", phone: "456-45-56", statusTitle: "ready", pickupDate: "today", pickupTime: "13:30"))
            return cell
        case .universalDoorDash:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalTableViewCell",for: indexPath) as! UniversalTableViewCell? else {
                return UITableViewCell()
            }
           // cell.setupCellViews()
            return cell
        case .driveThrough:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DriveThroughQueueOrdersViewControllerTableCell",for: indexPath) as! DriveThroughQueueOrdersViewControllerTableCell? else {
                return UITableViewCell()
            }
            cell.orderNumberLabel.text = "123456"
            cell.customerNameLabel.text = "Andry"
            cell.customerVehicleLabel.text = "BMW"
            cell.itemsQtyLabel.text = "IDK"
            cell.priceLabel.text = "33$"
            cell.statusLabel.text = "Waiting"
            cell.timeElapsedLabel.text = "2:34"
            cell.setup()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

//        let arrs = [view2, view1, view3]
//        for index in 0..<3{
//            arrs[index].translatesAutoresizingMaskIntoConstraints = false
//        }
//        for index in 0..<3{
//            stackView.addArrangedSubview(arrs[index])
//        }
//        stackView.arrangedSubviews[0].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
//        stackView.arrangedSubviews[1].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
//        stackView.arrangedSubviews[2].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        
enum CustomCell{
    case universal
    case doorDash
    case universalDoorDash
    case driveThrough
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
              orderType: "Delivery",
              statusTitle: "Ready",
              sourceImage: UIImage(systemName: "airtag")!,
              timeElapsed: "3:42",
              timeElapsedIsOverdue: false,
              itemsCount: 3,
              isPaid: true,
              numberOfItems: 4,
              phone: "8-800-555-35-35"),
        Order(displayId: "123457",
              total: "$33.50",
              customerName: "Frodo Begins",
              vehicleInfo: nil,
              pickupTime: "13:30",
              pickupDate: "Today",
              orderType: "Delivery",
              statusTitle: "Ready",
              sourceImage: UIImage(systemName: "airtag")!,
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
              statusTitle: "Ready",
              sourceImage: UIImage(systemName: "airtag")!,
              timeElapsed: "3:42",
              timeElapsedIsOverdue: true,
              itemsCount: 3,
              isPaid: true,
              numberOfItems: 4,
              phone: "8-800-555-35-35")
        ]
}
