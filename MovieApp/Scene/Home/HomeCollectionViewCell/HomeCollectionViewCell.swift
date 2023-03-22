//
//  HomeCollectionViewCell.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 19.03.2023.
//

import UIKit
import Kingfisher


class HomeCollectionViewCell: UICollectionViewCell {
    
    let viewModel = HomeViewModel()
    
    @IBOutlet weak var nowCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchTextField! {
        didSet{
            searchBar.addIcon(direction: .Left, imageName: "search", Frame: CGRect(x: 16, y: 0, width: 24, height: 24))
            searchBar.attributedPlaceholder = NSAttributedString(
                string: "Movie, category...", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "primary.900") ?? .blue]
            )
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewModelConfiguration()


        nowCollectionView.register(UINib(nibName: "NowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NowCollectionViewCell")
        popularCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
    }
    
    fileprivate func viewModelConfiguration() {
        viewModel.getNowPlayingItems()
        viewModel.errorCallback = { [weak self] errorMessage in
            print("error: \(errorMessage)")
        }
        viewModel.succesCallback = { [weak self] in
            self?.nowCollectionView.reloadData()
        }
    }

}

extension HomeCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case nowCollectionView:
            return viewModel.movie?.results?.count ?? 1
        case popularCollectionView:
            return 8
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nowCollectionViewCell = nowCollectionView.dequeueReusableCell(withReuseIdentifier: "NowCollectionViewCell", for: indexPath) as! NowCollectionViewCell
        let movie = viewModel.movie?.results?[indexPath.row]
        if let path = movie?.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)")
            nowCollectionViewCell.image.kf.setImage(with: url)
        }
        
        nowCollectionViewCell.name.text = movie?.title
        
        
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
            // show movie detail with movieid
            let movie = viewModel.movie?.results?[indexPath.row]
            let movieId = movie?.id
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let detailVC = storyboard.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController {
                detailVC.modalPresentationStyle = .fullScreen
                detailVC.movieId = movieId
                self.window?.rootViewController?.present(detailVC, animated: true, completion: nil)
                
            }
            

        }
        
        
    }
    
    
}

extension HomeCollectionViewCell: UICollectionViewDelegate {
    
}
