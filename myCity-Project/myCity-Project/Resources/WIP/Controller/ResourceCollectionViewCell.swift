//
//  ResourceCollectionViewCell.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/20/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ResourceCollectionViewCell: UICollectionViewCell {
    static var identifier: String = "CCell"
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var resourceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
