//
//  cProfile.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/23/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

struct ProfileSection: Section {
    var numberOfItems: Int = 4
    
    let people: [Creator] = [
        Creator(profileImg: "Henry", title: "Reseacher, Front End, and Mobile Developer", details: "Henry is an iOS developer at the Make School Product college. Focusing time into mobile development, he works on building the UI for a number of different projects ranging from consumer based applications, mobile games, to educational / resources apps that would assist others. Always looking for an opportunity, he is furthering his goals by looking into data science and beyond the simple scope of mobile alone. His primary goal is to work on and build projects that would bring happiness to other people, no matter the format. With this project, he hopes to further help others, and also help develop his skills beyond the current strain by working out building a custom API that a mobile app could work with as well as making a project that works between two different formats. "),
        Creator(profileImg: "Chris", title: "PM, Front & Back End Developer", details: "Chris is a computer science student at Make School following the concentrations Data Science & Back End Web Development.He enjoys working in the STEM fields and had a blast as a FRC programmer from 2015-2019 on team 2927. "),
        Creator(profileImg: "Gideon", title: "Reseacher and Outreach lead, also Front End Developer", details: "Gideon is an adult student at Make School learning full stack web development with a focus on the front-end. He’s caught the coding bug and is looking forward to applying his new-found skills towards building applications that enhance people’s lives and contribute towards making the world a better place. You can view some of his early work as an engineering student here."),
        Creator(profileImg: "Ben", title: "Reseacher, Front End, and Mobile Developer", details: "Ben is an IOS developer at Make School focusing on swift development and working on full-stack web development processes. He has made a couple applications that use the development of API’s and created software to process data from apple’s news site data. With his upbeat attitude, Ben wants his focus to be on helping those less fortunate and build better resources in the hope of giving people a chance to build a better life for themselves. ")
    ]
    
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(350), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        cell.profileImage.image = UIImage(named: people[indexPath.row].profileImg)
        cell.profileTitle.text = people[indexPath.row].title
        cell.profileDetail.text = people[indexPath.row].details
//        cell.backgroundColor = .cyan
        return cell
    }
    
    
}
