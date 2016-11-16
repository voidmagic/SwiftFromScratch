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
        
        view.backgroundColor = UIColor.black
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(ClearTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ClearTableViewCell
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
   
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(indexPath.row) / CGFloat(itemCount)) * 0.6
        cell.backgroundColor =  UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }
    
    
}

