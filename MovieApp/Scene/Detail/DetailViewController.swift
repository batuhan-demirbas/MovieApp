//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 16.03.2023.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    
    
    let viewModel = DetailViewModel()
    var movie: MovieDetail?
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "\(DetailTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(DetailTableViewCell.self)")
        viewModelConfiguration()
        
        let imageRatio = 0.842
        let imageHeight = view.frame.width / imageRatio
        
        headerImageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        headerView.dropShadow()
        
    }
    
    fileprivate func viewModelConfiguration() {
        viewModel.getMovieDetailData(movieId: movieId ?? 0)
        viewModel.errorCallback = { [weak self] errorMessage in
            print("error: \(errorMessage)")
        }
        viewModel.succesCallback = { [self] in
            self.movie = self.viewModel.movie
            
            if let path = self.movie?.posterPath {
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)")
                self.headerImageView.kf.setImage(with: url)
                self.headerImageView.addGradient(height: self.headerImageView.frame.height, width: self.headerImageView.frame.width, color: UIColor(named: "primary.900")!)
            }
            self.tableView.reloadData()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTableViewCell.self)", for: indexPath) as! DetailTableViewCell
        
        if let path = movie?.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)")
            cell.poster.kf.setImage(with: url)
            cell.poster.addGradient(height: cell.poster.frame.height, width: cell.poster.frame.width, color: UIColor(named: "primary.900")!)
        }
        cell.title.text = movie?.title
        cell.overview.text = movie?.overview
        cell.info.text = self.viewModel.configureInfoLabel(releaseDate: movie?.releaseDate ?? "", runtime: movie?.runtime ?? 0)
        cell.ratingCount.text = "\(movie?.voteCount ?? 0) ratings"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let imageRatio = 0.842
        let imageHeight = view.frame.width / imageRatio
        if offsetY > (imageHeight - headerView.frame.height - view.safeAreaInsets.top) {
            headerImageView.isHidden = false
        } else {
            headerImageView.isHidden = true
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    
}
