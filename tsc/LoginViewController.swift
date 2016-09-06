//
//  LoginViewController.swift
//  tsc
//
//  Created by yao xiao on 06/09/2016.
//  Copyright © 2016 yao xiao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登陆"
        view.backgroundColor = UIColor(red: 240/255, green: 241/255, blue: 242/255, alpha: 1.0)
        
        let backgroundWhiteView = UIView(frame: CGRect(x: 10, y: 100, width: ScreenWidth - 20, height: 80))
        backgroundWhiteView.backgroundColor = UIColor.white
        view.addSubview(backgroundWhiteView)
        
        let name_imageView = UIImageView(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        name_imageView.backgroundColor = UIColor.white
        name_imageView.image = UIImage(named: "man")
        backgroundWhiteView.addSubview(name_imageView)
        
        let name_textField = UITextField(frame: CGRect(x: 40, y: 0, width: ScreenWidth - 60, height: 40))
        name_textField.placeholder = "用户名／邮箱／手机号"
        name_textField.backgroundColor = UIColor.white
        backgroundWhiteView.addSubview(name_textField)
        
        
        let password_imageView = UIImageView(frame: CGRect(x: 0, y: 45, width: 30, height: 30))
        password_imageView.backgroundColor = UIColor.white
        password_imageView.image = UIImage(named: "password")
        backgroundWhiteView.addSubview(password_imageView)
        
        let password_textField = UITextField(frame: CGRect(x: 40, y: 40, width: ScreenWidth - 60, height: 40))
        password_textField.placeholder = "请输入密码"
        password_textField.backgroundColor = UIColor.white
        backgroundWhiteView.addSubview(password_textField)
        
        
        let forgetPassword_Button = UIButton(type: .system)
        forgetPassword_Button.frame = CGRect(x: ScreenWidth - 90, y: 190, width: 80, height: 25)
        forgetPassword_Button.setTitle("忘记密码？", for: .normal)
        forgetPassword_Button.tintColor = UIColor.lightGray
        view.addSubview(forgetPassword_Button)
        
        
        let login_Button = UIButton(type: .system)
        login_Button.frame = CGRect(x: 10, y: 230, width: ScreenWidth - 20, height: 40)
        login_Button.setTitle("登陆", for: .normal)
        login_Button.backgroundColor = UIColor(red: 80/255, green: 149/255, blue: 3/255, alpha: 1.0)
        login_Button.tintColor = UIColor.white
        login_Button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(login_Button)
        
        let setup_Button = UIButton(type: .system)
        setup_Button.frame = CGRect(x: 10, y: 270, width: ScreenWidth - 20, height: 40)
        setup_Button.setTitle("注册", for: .normal)
        setup_Button.backgroundColor = UIColor.clear
        setup_Button.tintColor = UIColor(red: 80/255, green: 149/255, blue: 3/255, alpha: 1.0)
        view.addSubview(setup_Button)
        
        
        let other_label = UILabel(frame: CGRect(x: 10, y: 340, width: ScreenWidth - 20, height: 25))
        other_label.text = "其他登陆方式"
        other_label.textColor = UIColor.lightGray
        other_label.textAlignment = .center
        view.addSubview(other_label)
        
        let qq_button = UIButton(frame: CGRect(x: 0, y: 355, width: ScreenWidth / 3, height: ScreenWidth / 3))
        qq_button.setImage(UIImage(named: "qq"), for: .normal)
        view.addSubview(qq_button)
        
        let wechat_button = UIButton(frame: CGRect(x: ScreenWidth / 3, y: 355, width: ScreenWidth / 3, height: ScreenWidth / 3))
        wechat_button.setImage(UIImage(named: "weixin"), for: .normal)
        view.addSubview(wechat_button)
        
        let weibo_button = UIButton(frame: CGRect(x: ScreenWidth / 3 * 2, y: 355, width: ScreenWidth / 3, height: ScreenWidth / 3))
        weibo_button.setImage(UIImage(named: "weibo"), for: .normal)
        view.addSubview(weibo_button)
        
    }
    
    
    func loginButtonTapped() {
        let tabBarVC = UITabBarController()
        
        let mainVC = NavigationController(rootViewController: MainViewController())
        mainVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home_qian"), selectedImage: nil)
        
        let discoverVC = NavigationController(rootViewController: DiscoverViewController())
        discoverVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "find_qian"), selectedImage: nil)
        
        let cartVC = NavigationController(rootViewController: CartViewController())
        cartVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "shop"), selectedImage: nil)
        
        let userVC = NavigationController(rootViewController: UserViewController())
        userVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "man"), selectedImage: nil)
        
        
        tabBarVC.viewControllers = [mainVC, discoverVC, cartVC, userVC]
        tabBarVC.selectedIndex = 0
        tabBarVC.modalTransitionStyle = .flipHorizontal
        
        present(tabBarVC, animated: true, completion: nil)
    }
    
    
}
