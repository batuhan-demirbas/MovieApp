//
//  DetailManager.swift
//  MovieApp
//
//  Created by Batuhan on 19.03.2023.
//

import Foundation

protocol DetailManagerProtocol {
    func getMovieDetail(movieId: Int, complete: @escaping((MovieDetail?, Error?)->()))
}

class DetailManager: DetailManagerProtocol {
    static let shared = DetailManager()
    
    func getMovieDetail(movieId: Int, complete: @escaping((MovieDetail?, Error?)->())) {
        NetworkManager.shared.request(type: MovieDetail.self, url: DetailEndpoint.detail.path(movieId: movieId), method: .get) { response in
            switch response {
            case .success(let data):
                print(response)
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
    
    func getCredits(movieId: Int, complete: @escaping((Credits?, Error?)->())) {
        NetworkManager.shared.request(type: Credits.self, url: DetailEndpoint.detail.creditsPath(movieId: movieId), method: .get) { response in
            switch response {
            case .success(let data):
                print(response)
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
    
}
