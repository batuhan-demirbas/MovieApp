//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 19.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "\(HomeCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCollectionViewCell.self)")
        
    }

}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCollectionViewCell.self)", for: indexPath) as! HomeCollectionViewCell
        return cell
    }
    
    
}
