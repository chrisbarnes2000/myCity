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
        Resource(name: "Health", image: "ggb", url: "http://my-city.dev.my-city.club/Health_resources/"),
        Resource(name: "Benefits", image: "ggb", url: "http://my-city.dev.my-city.club/Benefits/"),
        Resource(name: "Shelters", image: "ggb", url: "http://my-city.dev.my-city.club/Shelter-info/"),
        Resource(name: "Food", image: "ggb", url: "http://my-city.dev.my-city.club/Food-locations/"),
        Resource(name: "Legal Help", image: "", url: "http://my-city.dev.my-city.club/Legal-help/")
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
//        let cell = resourceCollection.cellForItem(at: indexPath) as! ResourceCollectionViewCell
        let vc = ResourceWebViewController()
        let resource = resources[indexPath.row]
        print(resource)
        vc.pageTitle = resource.name
        vc.urlSet = resource.url
        print("Selected an Item")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
