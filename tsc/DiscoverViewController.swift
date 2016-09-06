//
//  DiscoverViewController.swift
//  tsc
//
//  Created by yao xiao on 06/09/2016.
//  Copyright © 2016 yao xiao. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    var titleLabel: UILabel!
    var detailView: UIView!
    
    let dd = RightTableViewDD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let scanButton = UIBarButtonItem(image: UIImage(named: "scan"), style: .plain, target: self, action: #selector(scanButtonTapped))
        navigationItem.leftBarButtonItem = scanButton
        
        let messageButton = UIBarButtonItem(image: UIImage(named: "new"), style: .plain, target: self, action: #selector(messageButtonTapped))
        navigationItem.rightBarButtonItem = messageButton
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜索"
        navigationItem.titleView = searchBar
        
        
        let left_tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth * 0.25, height: ScreenHeight))
        left_tableView.separatorStyle = .none
        left_tableView.dataSource = self
        left_tableView.delegate = self
        view.addSubview(left_tableView)
        
        let indexPath = IndexPath(row: 0, section: 0)
        left_tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
        
        
        let right_tableView = UITableView(frame: CGRect(x: ScreenWidth * 0.25, y: 50, width: ScreenWidth * 0.75, height: ScreenHeight - 50))
        right_tableView.separatorStyle = .none
        right_tableView.dataSource = dd
        right_tableView.delegate = dd
        view.addSubview(right_tableView)
        
        
        titleLabel = UILabel(frame: CGRect(x: ScreenWidth * 0.25, y: 64, width: ScreenWidth * 0.75, height: 50))
        titleLabel.backgroundColor = UIColor.white
        titleLabel.textColor = UIColor(red: 80/255, green: 149/255, blue: 3/255, alpha: 1.0)
        titleLabel.text = "  选项1"
        view.addSubview(titleLabel)
        
        
    }
    
    func scanButtonTapped() {
        
    }
    
    func messageButtonTapped() {
        
    }
    
}

extension DiscoverViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "选项\(indexPath.row + 1)"
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.backgroundColor = UIColor(red: 240/255, green: 241/255, blue: 242/255, alpha: 1.0)
        
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.backgroundColor = UIColor.white
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        titleLabel.text = "选项\(indexPath.row + 1)"
    }
}
