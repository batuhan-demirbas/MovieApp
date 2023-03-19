//
//  HomeManager.swift
//  MovieApp
//
//  Created by Batuhan on 19.03.2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getNowPlaying(complete: @escaping((Movie?, Error?)->()))
}

class HomeManager: HomeManagerProtocol {
    static let shared = HomeManager()
    
    func getNowPlaying(complete: @escaping((Movie?, Error?)->())) {
        NetworkManager.shared.request(type: Movie.self, url: HomeEndpoint.nowPlaying.path, method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
}
