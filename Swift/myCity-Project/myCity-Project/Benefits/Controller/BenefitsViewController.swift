//
//  BenefitsViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/29/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class BenefitsViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView(){
        self.view.addSubview(scrollView)
    }

}
