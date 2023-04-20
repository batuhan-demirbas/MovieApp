//
//  DetailTableViewCell.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 20.03.2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var similarCollectionView: UICollectionView!
    
    var movie: MovieDetail?
    var credits: Credits?
    let viewModel = DetailViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        genreCollectionView.register(UINib(nibName: "\(GenreCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(GenreCollectionViewCell.self)")
        
        similarCollectionView.delegate = self
        similarCollectionView.dataSource = self
        similarCollectionView.register(UINib(nibName: "\(SimilarCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SimilarCollectionViewCell.self)")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        viewModel.movie = movie
        
        if let path = movie?.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)")
            poster.kf.setImage(with: url)
            poster.addGradient(height: poster.frame.height, width: poster.frame.width, color: UIColor(named: "primary.900")!)
        }
        
        //title.text = movie?.title
        title.text = credits?.cast?.first?.name
        overview.text = movie?.overview
        info.text = viewModel.configureInfoLabel(releaseDate: movie?.releaseDate ?? "", runtime: movie?.runtime ?? 0)
        ratingCount.text = "\(movie?.voteCount ?? 0) ratings"
        
        genreCollectionView.reloadData()
    }
    
    
    
}

extension DetailTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case genreCollectionView:
            return movie?.genres?.count ?? 0
        case similarCollectionView:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case genreCollectionView:
            do {
                if let genre = self.movie?.genres?[indexPath.row] {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(GenreCollectionViewCell.self)", for: indexPath) as! GenreCollectionViewCell
                    cell.button.titleLabel?.text = genre.name
                    return cell
                }
            }
        case similarCollectionView:
            do {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SimilarCollectionViewCell.self)", for: indexPath) as! SimilarCollectionViewCell
                return cell
            }
        default:
            return UICollectionViewCell()
        }
        return UICollectionViewCell()

    }
    
    
}

extension DetailTableViewCell: UICollectionViewDelegate {
    
}
