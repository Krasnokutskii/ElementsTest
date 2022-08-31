//
//  ViewController.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 14.8.22..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
 
    let orders: [Order] = TestData.orders
    
    @IBAction func buttonPressed(_ sender: Any) {
        switch queue {
        case .online:
            queue = .driveThrough
        case .driveThrough:
            queue = .DDDrive
        case .DDDrive:
            queue = .online
        }
        tableView.reloadData()
    }
   
    var queue: POSQueue = .online
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(RSUniversalTableViewCell.self, forCellReuseIdentifier: RSUniversalTableViewCell.reuseId)
    }
}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RSUniversalTableViewCell.reuseId ,for: indexPath) as? RSUniversalTableViewCell else {
            return UITableViewCell()
        }
        let order = orders[indexPath.row]
        
        switch queue {
        case .online:
            let allElements: [RSOrderQueueCellElement] = [
                .imageView(width: 82, image: order.sourceImage),
                //.priceAndNumber(width: 102, orderNumber: order.displayId, price: order.total, isPaid: order.isPaid),
                .nameAndCarInfo(width: 106, customerName: order.customerName, vehicleInfo: order.vehicleInfo),
                //.nameAndPhoneNumber(width: 120, name: order.customerName, phoneNumber: order.phone),
                .orderType(width: 126, orderType: order.orderType),
                .status(width: 120, status: order.statusTitle),
            ]
            var allView = allElements.map{ $0.view }
            let specView = SpecificViewElement(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
            specView.setup(orderNumber: order.displayId, price: order.total, isPaid: order.isPaid)
            allView.insert(specView, at: 1)
            cell.setup(with: allView)
            return cell
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        case .driveThrough:
            let allElements: [RSOrderQueueCellElement] = [
                .priceAndNumber(width: 120, orderNumber: order.displayId, price: order.total, isPaid: order.isPaid),
                .timeElapsed(width: 130, timeElapsed: order.timeElapsed, isOverdue: order.timeElapsedIsOverdue),
                .itemsQty(width: 100, quantity: order.itemsCount),
                .nameAndCarInfo(width: 166, customerName: order.customerName, vehicleInfo: order.vehicleInfo),
                .status(width: 220, status: order.statusTitle),
            ]
            let allView = allElements.map{ $0.view }
            cell.setup(with: allView)
            return cell
        case .DDDrive:
            let allElements: [RSOrderQueueCellElement] = [
                .numberAndItemCount(width: 120, itemsAmount: order.itemsCount, number: order.displayId),
                .nameAndPhoneNumber(width: 166, name: order.customerName, phoneNumber: order.phone),
                .orderType(width: 126, orderType: order.orderType),
                .status(width: 220, status: order.statusTitle),
            ]
            let allView = allElements.map{ $0.view }
            cell.setup(with: allView)
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

struct Order{
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


public enum RSOrderQueueCellElement {
    case imageView(width:CGFloat, image: UIImage)
    case priceAndNumber(width: CGFloat,orderNumber: String, price: String, isPaid: Bool)
    case nameAndCarInfo(width: CGFloat,customerName: String, vehicleInfo: String? = nil)
    case timeAndData(width: CGFloat,pickupTime: String, pickupDate: String)
    case orderType(width: CGFloat,orderType: String)
    case status(width: CGFloat, status: String)
    case numberAndItemCount(width: CGFloat,itemsAmount: Int,number: String)
    case nameAndPhoneNumber(width: CGFloat,name: String, phoneNumber: String)
    case itemsQty(width: CGFloat,quantity: Int)
    case timeElapsed(width: CGFloat,timeElapsed: String, isOverdue: Bool)
    
    public var view: UIView{
        switch self{
        case .imageView(let width, let image):
            let view = RSImageViewElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setupImage(image)
            return view
        case .priceAndNumber(let width, let orderNumber, let price, let isPaid):
            let view = RSPriceAndNumberElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(orderNumber: orderNumber, price: price, isPaid: isPaid)
            return view
        case .nameAndCarInfo(let width,let customerName, let vehicleInfo):
            let view = RSNameAndCarInfoElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(customerName: customerName, vehicleInfo: vehicleInfo)
            return view
        case .timeAndData(let width,let pickupTime,let pickupDate):
            let view = RSTimeAndDateElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(pickupTime: pickupTime, pickupDate: pickupDate)
            return view
        case .orderType(let width, let orderType):
            let view = RSOrderTypeElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(orderType: orderType)
            return view
        case .status(let width, let status):
            let view = RSStatusElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(status: status)
            return view
        case .numberAndItemCount(let width, let itemsAmount, let number):
            let view = RSNumberAndItemsElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(itemsAmount: itemsAmount, number: number)
            return view
        case .nameAndPhoneNumber(let width, let name, let phoneNumber):
            let view = RSNameAndPhoneNumberElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(name: name, phoneNumber: phoneNumber)
            return view
        case .itemsQty( let width, let quantity):
            let view = RSItemsQtyElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(quantity: quantity)
            return view
        case .timeElapsed(let width, let timeElapsed, let isOverdue):
            let view = RSTimeElapsedElement(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            view.setup(timeElapsed: timeElapsed, isOverdue: isOverdue)
            return view
        }
    }
}

enum POSQueue{
    case online, driveThrough, DDDrive
}
