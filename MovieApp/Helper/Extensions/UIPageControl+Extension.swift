//
//  UIPageController.swift
//  MovieApp
//
//  Created by Batuhan on 4.03.2023.
//

import UIKit

extension UIPageControl {
    var page: Int {
        get {
            return currentPage
        }
        set {
            currentPage = newValue
            setIndicatorImage(UIImage(named: "currentPageIndıcator"), forPage: newValue)
            
            for page in 0..<numberOfPages where page != newValue  {
                setIndicatorImage(UIImage(named: "pageIndıcator"), forPage: page)
            }
        }
    }
}
