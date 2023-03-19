//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 19.03.2023.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidUrl = "invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    var baseURL = "https://api.themoviedb.org/3/"
    var apiKey = "81aac2e28f6b9a257102948ab0e5c1de"
    
    func requestUrl(url: String) -> String {
        baseURL + url + "?api_key=\(apiKey)" 
    }
}
