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
    
    //MARK: Setup Control
    func setupControl(){
        //Setup Color Scheme
        self.tabBar.barTintColor = UIColor(named: "myCityBlue")
        self.tabBar.unselectedItemTintColor = UIColor.white
        self.tabBar.tintColor = UIColor(named: "veryLightGrey")
        //=================
        let home = HomeViewController()
        home.title = "Home"
        let navHome = UINavigationController(rootViewController: home)
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "house"), tag: 0)
        
        let resources = ResourceViewController()
        resources.title = "Resources"
        let navRes = UINavigationController(rootViewController: resources)
        resources.tabBarItem = UITabBarItem(title: "Resources", image: UIImage(named: "wrench"), tag: 1)
        
        let pandemic = PandemicViewController()
        pandemic.title = "Pandemic"
        let navPandem = UINavigationController(rootViewController: pandemic)
        pandemic.tabBarItem = UITabBarItem(title: "Pandemic", image: UIImage(named: "coronavirus"), tag: 2)
        
        let creators = CreatorsViewController()
        creators.title = "Creators"
        let navCreate = UINavigationController(rootViewController: creators)
        creators.tabBarItem = UITabBarItem(title: "Creators", image: UIImage(named: "creators"), tag: 3)
        
        viewControllers = [navHome, navRes, navPandem, navCreate]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")
    }
}

//MARK: Attributes
//Home
//Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

//Resources
//Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

//Creators
//Icons made by <a href="https://www.flaticon.com/authors/eucalyp" title="Eucalyp">Eucalyp</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

//Pandemic
//Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
