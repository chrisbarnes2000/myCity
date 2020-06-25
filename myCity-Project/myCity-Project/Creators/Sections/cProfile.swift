//
//  cProfile.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/23/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

struct ProfileSection: Section {
    var numberOfItems: Int = 1
    
    let people: [Creator] = [
        Creator(profileImg: "", title: "Reseacher, Front End, and Mobile Developer", details: "Henry is an iOS developer at the Make School Product college.")
    ]
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.9))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        cell.profileImage.image = UIImage(named: people[indexPath.row].profileImg)
        cell.profileTitle.text = people[indexPath.row].title
        cell.profileDetail.text = people[indexPath.row].title
        return cell
    }
    
    
}
