//
//  DetailHelper.swift
//  MovieApp
//
//  Created by Batuhan on 19.03.2023.
//

import Foundation

enum DetailEndpoint: String {
    case detail = "/movie/"
    case credits = "/credits"
    
    func path(movieId: Int) -> String {
        return NetworkHelper.shared.requestUrl(url: DetailEndpoint.detail.rawValue + "\(movieId)")
    }
    
    func creditsPath(movieId: Int) -> String {
        return NetworkHelper.shared.requestUrl(url: DetailEndpoint.detail.rawValue + "\(movieId)/" + DetailEndpoint.credits.rawValue)
    }
}
