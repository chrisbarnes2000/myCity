//
//  CustomViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 7/2/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

//Resource(name: "Better Help", image: ""),
//Resource(name: "Benefits", image: ""),
//Resource(name: "Shelters", image: ""),
//Resource(name: "Food", image: ""),
//Resource(name: "Legal Help", image: "")

class CustomViewController: UIViewController {
    
    var selection: String = "Benefits"
    
    var betterHelp: CustomView!
    var benefits: CustomView!
    var shelters: CustomView!
    var food: CustomView!
    var legalHelp: CustomView!
    
    var setView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupView()
    }
    
    func setViews(){
        benefits = CustomView(pageName: "How to apply for benefits and help in SF:", info:"Food Stamps/n Hello")
        
        
        if selection == "Better Help"{
            setView = betterHelp
        }else if selection == "Benefits"{
            setView = benefits
        }else if selection == "Shelters"{
            setView = shelters
        }else if selection == "Food"{
            setView = food
        }else if selection == "Legal Help"{
            setView = legalHelp
        }
    }
    
    func setupView(){
        self.view.addSubview(setView)
        NSLayoutConstraint.activate([
            setView.topAnchor.constraint(equalTo: self.view.topAnchor),
            setView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            setView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            setView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }

}
