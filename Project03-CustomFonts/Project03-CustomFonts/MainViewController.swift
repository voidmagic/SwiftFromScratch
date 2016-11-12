//
//  MainViewController.swift
//  Project03-CustomFonts
//
//  Created by 王迁 on 2016/11/12.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    private var showFontsFamilies = [String]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private let customFontsFamilies = ["MF JinHei (Noncommercial)", "MF TongXin (Noncommercial)", "MF ZhiHei (Noncommercial)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        systemFontButtonClicked()
        tableView.delaysContentTouches = false
    }

    @objc private func systemFontButtonClicked() {
        showFontsFamilies = UIFont.familyNames.sorted().filter {
            !customFontsFamilies.contains($0)
        }
    }
    
    @objc private func customFontButtonClicked() {
        showFontsFamilies = customFontsFamilies
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showFontsFamilies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableCellView()
        cell.fontName = showFontsFamilies[indexPath.row]
        return cell;
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TableHeaderView()
        header.leftButton.addTarget(self, action: #selector(systemFontButtonClicked), for: .touchUpInside)
        header.rightButton.addTarget(self, action: #selector(customFontButtonClicked), for: .touchUpInside)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
}

