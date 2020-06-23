//
//  HomeViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/15/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
//        configureNavigationBar()
    }
    
//    func configureNavigationBar(){
//        navigationController?.navigationBar.barTintColor = .darkGray
//        navigationController?.navigationBar.barStyle = .black
//
//        navigationItem.title = "Home"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "hamburgerIconWhite3").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
//    }
    
    @objc func handleMenuToggle(){
        print("Toggle Menu")
    }

}
