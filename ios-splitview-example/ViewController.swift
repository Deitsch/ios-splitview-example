//
//  ViewController.swift
//  ios-splitview-example
//
//  Created by Simon Deutsch on 26.04.22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        let label = UITextField()
//        label.text = "some text"
//        view.addSubview(label)
//        label.centerInSuperView()
    }
}

extension UIView {
    func centerInSuperView() {
        guard let superView = superview else { return }
        centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
}

class TableViewController: UITableViewController {
    let data = ["Simon", "Martin", "David"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
