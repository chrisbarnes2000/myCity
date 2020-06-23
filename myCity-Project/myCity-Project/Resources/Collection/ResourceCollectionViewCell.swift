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
        
    }
    
    func loadCell(){
        self.contentView
    }
}
