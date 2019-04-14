//
//  TableViewController.swift
//  LoadMore
//
//  Created by Anh vũ on 4/5/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var SpinerView: UIActivityIndicatorView!
    var number = [1, 3]
    var toltal = 40
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(number[indexPath.row])"
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = number.count - 1
        if number.count < toltal && indexPath.row == lastItem {
            loadData()
            SpinerView.isHidden = false
            SpinerView.startAnimating()
        } else {
            SpinerView.stopAnimating()
            SpinerView.isHidden = true
        }
    }
    func loadData() {
        let lastItem = number.last!
        let newItem = lastItem + 1
        number.append(newItem)
        tableView.reloadData()
    }
   
}
