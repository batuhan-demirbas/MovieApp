//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 28.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchTextField! {
        didSet{
            searchBar.addIcon(direction: .Left, imageName: "search", Frame: CGRect(x: 16, y: 0, width: 24, height: 24))
            searchBar.attributedPlaceholder = NSAttributedString(
                string: "Movie, category...", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "primary.900") ?? .blue]
            )
        }
    }
    
    @IBOutlet weak var nowCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
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

extension HomeViewController: UICollectionViewDelegate {
    
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
    
    
}

