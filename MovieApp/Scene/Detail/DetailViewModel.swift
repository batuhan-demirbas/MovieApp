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
    var credits: Credits?
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
    
    func getCreditsData(movieId: Int) {
        manager.getCredits(movieId: movieId, complete: { [weak self] credits, error in
            guard let self = self else { return }
            if let error = error {
                self.errorCallback?(error.localizedDescription)
            } else {
                self.credits = credits
                self.succesCallback?()
            }
        })
    }
    
    func configureInfoLabel(releaseDate: String, runtime: Int) -> String{
        let country = movie?.productionCountries?.first?.iso3166_1 ?? ""
        let infoLabel = releaseYear(date: releaseDate) + " · " + runtimeFormat(runtime: runtime) + " · " +  country
        if movie?.adult ?? false {
            return infoLabel + " · +18"
        } else {
            return infoLabel
        }
    }
    
    func runtimeFormat(runtime: Int) -> String{
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        
        if let formattedString = formatter.string(from: TimeInterval(runtime * 60)) {
            return formattedString
        }
        return ""
    }
    
    func releaseYear(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: date) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            return String(year)
        }
        return ""
    }
    
}
