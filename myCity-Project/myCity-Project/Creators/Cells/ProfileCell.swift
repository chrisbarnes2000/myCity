//
//  ProfileCell.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/23/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    static var identifier: String = "ProfileCell"
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileTitle: UILabel!
    @IBOutlet weak var profileDetail: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

}
