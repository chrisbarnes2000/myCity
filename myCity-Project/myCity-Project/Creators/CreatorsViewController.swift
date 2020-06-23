//
//  CreatorsViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/23/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class CreatorsViewController: UIViewController {
    
    var collectView: UICollectionView!
    
    lazy var sections: [Section] = [
        HeaderSection(),
        ProfileSection()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setPage()
    }
    
    func setPage(){
        
    }

}
