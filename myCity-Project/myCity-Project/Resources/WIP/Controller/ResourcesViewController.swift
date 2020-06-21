//
//  ResourcesViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/18/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var resourceCollectionView: UICollectionView!
    
    let resources: [String] = ["Money","Medical","Shelters","Laws"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resourceCollectionView.register(ResourceCollectionViewCell.self, forCellWithReuseIdentifier: ResourceCollectionViewCell.identifier)
        resourceCollectionView.delegate = self
        resourceCollectionView.dataSource = self
    }
}

extension ResourcesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ResourceCollectionViewCell = resourceCollectionView.cellForItem(at: indexPath) as! ResourceCollectionViewCell
        cell.resourceLabel.text = resources[indexPath.row]
        return cell
    }
    
    
}
