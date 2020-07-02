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
    var pageName: String!
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(20)
        label.textColor = UIColor(named: "myCityBlue")
        return label
    }()
    
    let textView: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    

    required init(pageName: String, info: String) {
        super.init(frame: .zero)
        self.pageName = pageName
        self.info = info
        self.setup()
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
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
        titleLabel.text = pageName
        
        self.addSubview(textView)
        textView.text = info
    }

}
