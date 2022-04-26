//
//  ViewController.swift
//  ios-splitview-example
//
//  Created by Simon Deutsch on 26.04.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.labelText = data[indexPath.row]
        splitViewController?.showDetailViewController(vc, sender: nil)
    }
}
