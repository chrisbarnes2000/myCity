//
//  ResourceViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/20/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {
    
    lazy var resourceCollection: UICollectionView = {
        let cView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        cView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cView.delegate = self
        cView.dataSource = self
        cView.backgroundColor = .white
        cView.alwaysBounceVertical = true
        cView.collectionViewLayout = CustomFlowLayout()
        cView.register(ResourceCollectionViewCell.self, forCellWithReuseIdentifier: ResourceCollectionViewCell.identifier)
        return cView
    }()
    
    let resources: [Resource] = [
        Resource(name: "R1", image: "menu-icon"),
        Resource(name: "R2", image: "menu-icon"),
        Resource(name: "R3", image: ""),
        Resource(name: "R4", image: ""),
        Resource(name: "R5", image: ""),
        Resource(name: "R6", image: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Resources"
        view.addSubview(resourceCollection)
    }
    
}

extension ResourceViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResourceCollectionViewCell.identifier, for: indexPath) as! ResourceCollectionViewCell
        cell.imageView.image = UIImage(named: "menu-icon")
        cell.textResource.text = "\(resources[indexPath.row].name)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected an Item")
    }
    
    
}
