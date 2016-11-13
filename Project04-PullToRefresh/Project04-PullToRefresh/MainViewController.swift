//
//  ViewController.swift
//  Project04-PullToRefresh
//
//  Created by 王迁 on 2016/11/13.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    
    private var allData = [
        ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"],
        ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸"]]
    
    private var showData = [String]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private var dataIndex = 0 {
        didSet {
            showData = allData[dataIndex]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRefreshControl()
        dataIndex = 0
    }
    
    private func initRefreshControl() {
        self.refreshControl = UIRefreshControl()
        let refreshControlTitle = NSAttributedString(string: "last updated on \(Date())")
        refreshControl?.attributedTitle = refreshControlTitle
        refreshControl?.addTarget(self, action: #selector(refreshContents), for: .valueChanged)
    }
    
    // MARK: table view datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "tableviewcell")
        cell.textLabel?.text = showData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    // MARK: action handler
    @objc private func refreshContents() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {
            timer in
            self.dataIndex = 1 - self.dataIndex
            self.refreshControl?.endRefreshing()
        }
    }


}

