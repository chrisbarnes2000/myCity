//
//  ContainerViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/18/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

//Side Menu in iOS Like a Professional | Swift 4 (Pt. 1)
//https://www.youtube.com/watch?v=dB-vB9uDRCI

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()

        // Do any additional setup after loading the view.
    }
    
    func configureHomeController(){
        let homeController = HomeViewController()
        let controller = UINavigationController(rootViewController: homeController)
        
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    
    func configureMenuController(){
        
    }
    

}
