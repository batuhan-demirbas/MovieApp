//
//  NowPlaying.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 11.03.2023.
//

import Foundation

struct NowPlaying: Decodable {
  let posterPath: String?
  let adult: Bool
  let overview: String
  let releaseDate: String
  let genreIds: [Int]
  let id: Int
  let starships: [String]
  
  enum CodingKeys: String, CodingKey {
    case posterPath = "poster_path"
    case adult
    case overview
    case releaseDate = "release_date"
    case genreIds = "genre_ids"
    case id
    case starships
  }
}
