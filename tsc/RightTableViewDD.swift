//
//  RightTableViewD&D.swift
//  tsc
//
//  Created by yao xiao on 06/09/2016.
//  Copyright © 2016 yao xiao. All rights reserved.
//

import UIKit


class RightTableViewDD: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell1")
        let imageView = UIImageView(image: UIImage(named: "s0"))
        imageView.frame = CGRect(x: 10, y: 10, width: ScreenWidth * 0.75 - 20, height: 80)
        cell.contentView.addSubview(imageView)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}


