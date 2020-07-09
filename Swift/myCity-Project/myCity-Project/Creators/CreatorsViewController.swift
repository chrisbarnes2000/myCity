//
//  CreatorsViewController.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/23/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class CreatorsViewController: UIViewController {
    
    var collectView: UICollectionView!
    
    lazy var sections: [Section] = [
        HeaderSection(),
        ProfileSection()
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var section = self.sections
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return self.sections[sectionIndex].layoutSection()
        }
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setPage()
    }
    
    func setPage(){
        collectView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectView.delegate = self
        collectView.dataSource = self
        collectView.backgroundColor = .white
        collectView.register(UINib(nibName: "HeaderCell", bundle: .main), forCellWithReuseIdentifier: HeaderCell.identifier)
        collectView.register(UINib(nibName: "ProfileCell", bundle: .main), forCellWithReuseIdentifier: ProfileCell.identifier)
        self.view.addSubview(collectView)
        collectView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectView.reloadData()
    }

}

extension CreatorsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    
}
