//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Batuhan on 19.03.2023.
//

import Foundation

class HomeViewModel {
    let manager = HomeManager.shared
    
    var movie: Movie?
    var errorCallback: ((String)->())?
    var succesCallback: (()->())?
    
    func getNowPlayingItems() {
        manager.getNowPlaying { [weak self] movie, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.movie = movie
                self?.succesCallback?()
            }
            
        }
    }
    
}
