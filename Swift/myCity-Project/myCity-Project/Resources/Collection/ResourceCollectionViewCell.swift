//
//  ResourceCollectionViewCell.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/20/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ResourceCollectionViewCell: UICollectionViewCell {
    static var identifier: String = "RCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var textResource: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        loadCell()
        
        
        let textResource = UILabel(frame: .zero)
        self.textResource = textResource
        
        textResource.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textResource)
        textResource.textColor = UIColor(named: "myCityBlue")
        textResource.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        textResource.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
    }
    
    func loadCell(){
        self.contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
