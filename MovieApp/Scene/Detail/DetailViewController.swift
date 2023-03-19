//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 16.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    
    let viewModel = DetailViewModel()
    var movieId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImageView.addGradientInBackground(frame: backgroundImageView.bounds, colors: [.clear, UIColor(named: "primary.900") ?? .black])
        viewModelConfiguration()
        
        
    }
    
    fileprivate func viewModelConfiguration() {
        viewModel.getMovieDetailData(movieId: movieId ?? 0)
        viewModel.errorCallback = { [weak self] errorMessage in
            print("error: \(errorMessage)")
        }
        viewModel.succesCallback = { [weak self] in
            let movie = self?.viewModel.movie
            self?.titleLabel.text = movie?.title
            self?.overview.text = movie?.overview
        }
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
