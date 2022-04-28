//
//  ViewController.swift
//  ios-splitview-example
//
//  Created by Simon Deutsch on 26.04.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var label: UILabel?
    
    var labelText: String? {
        didSet {
            label?.text = labelText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label?.text = labelText
    }
}

class TableViewController: UITableViewController {
    let data = ["Simon", "Martin", "David"]
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vc.labelText = data[indexPath.row]
        splitViewController?.setViewController(vc, for: .secondary)
//        splitViewController?.showDetailViewController(vc, sender: nil)
        splitViewController?.show(.secondary)
    }
}
