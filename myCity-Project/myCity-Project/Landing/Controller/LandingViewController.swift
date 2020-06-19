//
//  LandingViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/15/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        goHome()
    }

    func goHome(){
        let nextVC = ContainerViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
