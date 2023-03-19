//
//  UIImageView+Extention.swift
//  MovieApp
//
//  Created by Batuhan on 16.03.2023.
//

import Foundation
import UIKit

extension UIImageView {
    
    func addGradientInBackground(frame: CGRect, colors:[UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.insertSublayer(gradient, at: 0)
       }}
