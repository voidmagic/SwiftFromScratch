//
//  ViewController.swift
//  table
//
//  Created by VoidMagic on 2016/11/22.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private let tableData = ["Swift From Scratch Project",
                             "Void Magic",
                             "Thanks to allenwong",
                             "30 days of swift",
                             "And The Mountains Echoed",
                             "Happy Hacking",
                             "Hola" ]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = tableData.count - 1
        let color = 0.9 * CGFloat(indexPath.row) / CGFloat(count)
        cell.backgroundColor = UIColor(red: color, green: 1.0, blue: 1.0, alpha: 1.0)
        
        cell.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.height)
        UIView.animate(withDuration: Double(indexPath.row) * 0.1 + 0.5) {
            cell.transform = CGAffineTransform.identity
        }
    }
}

