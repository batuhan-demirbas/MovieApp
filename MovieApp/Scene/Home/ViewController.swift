//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 28.02.2023.
//

import UIKit

/*
class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nowCollectionView.delegate = self
        nowCollectionView.dataSource = self
        nowCollectionView.register(UINib(nibName: "NowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NowCollectionViewCell")
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
        
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case nowCollectionView:
            return 10
        case popularCollectionView:
            return 8
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nowCollectionViewCell = nowCollectionView.dequeueReusableCell(withReuseIdentifier: "NowCollectionViewCell", for: indexPath) as! NowCollectionViewCell
        
        let popularCollectionViewCell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
        
        switch collectionView {
        case nowCollectionView:
            return nowCollectionViewCell
        case popularCollectionView:
            return popularCollectionViewCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == nowCollectionView {
            if let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController {
                detailVC.modalPresentationStyle = .fullScreen
                present(detailVC, animated: true, completion: nil)
            }
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}
 
 */

