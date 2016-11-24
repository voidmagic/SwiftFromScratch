//
//  MainViewController.swift
//  Project07-ClearTableViewCell
//
//  Created by VoidMagic on 2016/11/16.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var tableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    
    private let cellIdentifier = "cell"
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(ClearTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.textLabel?.text = tableData[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
   
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let color = 0.8 * CGFloat(indexPath.row) / CGFloat(tableData.count - 1)
        cell.backgroundColor =  UIColor(red: 0.0, green: color, blue: 1.0, alpha: 1.0)
    }
    
    
}

