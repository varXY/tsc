//
//  ViewController.swift
//  S0
//
//  Created by 文川术 on 5/19/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    var barBackgroundImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.tintColor = UIColor.black
        
        let rect = CGRect(x: 0, y: 0, width: ScreenWidth, height: 64)
        barBackgroundImage = UIImage.imageWithColor(UIColor(red: 240/255, green: 241/255, blue: 242/255, alpha: 1.0), rect: rect)
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.clear, rect: rect), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(UIColor.clear, rect: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        let scanButton = UIBarButtonItem(image: UIImage(named: "scan"), style: .plain, target: self, action: #selector(scanButtonTapped))
        navigationItem.leftBarButtonItem = scanButton
        
        let messageButton = UIBarButtonItem(image: UIImage(named: "new"), style: .plain, target: self, action: #selector(messageButtonTapped))
        navigationItem.rightBarButtonItem = messageButton
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜索"
        navigationItem.titleView = searchBar
        
        let pView = PView()
        pView.getPageForMainPage(VC: self)
        
        if let scrollView = view.viewWithTag(99999) as? UIScrollView {
            scrollView.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func scanButtonTapped() {
        
    }
    
    func messageButtonTapped() {
        
    }
    
    func open(sender: UIButton) {
        print(sender.tag)
    }
}


extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let rect = CGRect(x: 0, y: 0, width: ScreenWidth, height: 64)
        
        if scrollView.contentOffset.y < ScreenHeight * 0.3 {
            
            barBackgroundImage = UIImage.imageWithColor(UIColor(red: 240/255, green: 241/255, blue: 242/255, alpha: scrollView.contentOffset.y * 0.015), rect: rect)
            
        } else {
            barBackgroundImage = UIImage.imageWithColor(UIColor(red: 240/255, green: 241/255, blue: 242/255, alpha: 1.0), rect: rect)
        }
        
        navigationController?.navigationBar.setBackgroundImage(barBackgroundImage, for: .default)
    }
}
