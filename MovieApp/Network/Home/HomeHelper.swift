//
//  HomeHelper.swift
//  MovieApp
//
//  Created by Batuhan on 19.03.2023.
//

import Foundation

enum HomeEndpoint: String {
    case nowPlaying = "/movie/now_playing"
    
    var path: String {
        switch self {
        case .nowPlaying:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.nowPlaying.rawValue)
        }
    }
}
