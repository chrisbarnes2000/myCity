//
//  CustomView.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/30/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var info: String!
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let textView: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
//    let messageLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.font = UIFont(name: "Helvetica", size: 20)
//        label.textColor = UIColor(white: 1.0, alpha: 0.8)
//        return label
//    }()

    required init(info: String) {
        super.init(frame: .zero)
        self.info = info
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        
    }

}
