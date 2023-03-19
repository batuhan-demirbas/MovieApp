//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Batuhan on 19.03.2023.
//

import Foundation

class DetailViewModel {
    let manager = DetailManager.shared
    
    var movie: MovieDetail?
    var errorCallback: ((String)->())?
    var succesCallback: (()->())?
    
    func getMovieDetailData(movieId: Int) {
        manager.getMovieDetail(movieId: movieId, complete: { [weak self] movie, error in
            guard let self = self else { return }
            if let error = error {
                self.errorCallback?(error.localizedDescription)
            } else {
                self.movie = movie
                self.succesCallback?()
            }
        })
    }
    
}
