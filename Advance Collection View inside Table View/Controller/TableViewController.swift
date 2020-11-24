//
//  TableViewController.swift
//  Advance Collection View inside Table View
//
//  Created by Adwait Barkale on 24/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header")
        cell?.textLabel?.text = "Header : \(section + 1)"
        cell?.textLabel?.font = UIFont(name: "Verdana", size: 20)
        cell?.contentView.backgroundColor = .white
        return cell
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if indexPath.section % 2 == 0 {
            //print("Big Row = \(indexPath.row)")
            //print("Big Section = \(indexPath.section)")
            if indexPath.section == 2{
                cell.isRow3 = true
            }
            
            cell.configure(isBig: true) //Big Cell
        }else{
            print("Small Row = \(indexPath.row)")
            print("Small Section = \(indexPath.section)")
            cell.configure(isBig: false) //Small Cell
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section % 2 == 0 {
            return 200
        }else{
            return 130
        }
    }
    
}
