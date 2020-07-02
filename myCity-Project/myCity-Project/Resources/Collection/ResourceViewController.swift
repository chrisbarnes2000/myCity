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
        Resource(name: "Better Help", image: ""),
        Resource(name: "Benefits", image: ""),
        Resource(name: "Shelters", image: ""),
        Resource(name: "Food", image: ""),
        Resource(name: "Legal Help", image: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
//        self.navigationController = false
//        self.title = "Resources"
        view.addSubview(resourceCollection)
    }
    
}

extension ResourceViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResourceCollectionViewCell.identifier, for: indexPath) as! ResourceCollectionViewCell
        cell.imageView.image = UIImage(named: resources[indexPath.row].image)
        cell.textResource.text = "\(resources[indexPath.row].name)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Selected an Item")
    }
    
    
}
