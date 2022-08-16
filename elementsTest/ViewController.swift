//
//  ViewController.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 14.8.22..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UniversalTableViewCell.self, forCellReuseIdentifier: "UniversalTableViewCell")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
            
    }
    
}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalTableViewCell",for: indexPath) as? UniversalTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
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
        
