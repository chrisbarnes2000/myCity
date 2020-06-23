//
//  TabBarController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/23/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControl()
        self.delegate = self
    }
    
    func setupControl(){
        //Setup Color Scheme
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
        self.tabBar.tintColor = UIColor.gray
        //=================
        let home = HomeViewController()
        home.title = "Home"
        let navHome = UINavigationController(rootViewController: home)
        home.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let resources = ResourceViewController()
        resources.title = "Resources"
        let navRes = UINavigationController(rootViewController: resources)
        resources.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let creators = CreatorsViewController()
        creators.title = "Creators"
        let navCreate = UINavigationController(rootViewController: creators)
        creators.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
   
//        marketplace.tabBarItem = UITabBarItem(title: "Market", image: UIImage(named:"marketplace"), tag: 0)
        
        //        let profile = ProfileContentView()
        //        let profileVC = UIHostingController(rootView: profile)
        //        let navProf = UINavigationController(rootViewController: profileVC)
        //        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named:"user"), tag: 1)
        
        viewControllers = [navHome, navRes, navCreate]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")
    }
}
