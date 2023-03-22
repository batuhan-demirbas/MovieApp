//
//  UIView+Extention.swift
//  MovieApp
//
//  Created by Batuhan on 21.03.2023.
//

import UIKit

extension UIView {
    func dropShadow(scale: Bool = true, offSet:CGSize = .zero, opacity: Float = 0.6, color:UIColor = UIColor(named: "primary.900")!, radius:CGFloat = 20) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addGradient( height: CGFloat,  width: CGFloat, _ index: Int? = nil, color:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)) {
        if (layer.sublayers?.first(where: { ($0 is CAGradientLayer) })) != nil {
            return
        }
        
        let layer1 = CAGradientLayer()
        
        layer1.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
            
            color.cgColor,
        ]
        
        layer1.locations = [0, 1]
        
        layer1.startPoint = CGPoint(x: 0, y: 0)

        layer1.endPoint = CGPoint(x: 0, y: 1)
//        layer1.startPoint = CGPoint(x: 0.15, y: 0.05)
//
//        layer1.endPoint = CGPoint(x: 1, y: 0.05)
        
        //layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.36, c: -0.36, d: 0, tx: 0.68, ty: 0.4))
        
        // layer1.bounds = bounds.insetBy(dx: -0.5*bounds.size.width, dy: -0.5*bounds.size.height)
        
        layer1.frame = CGRect(origin: CGPoint(x: -1, y: -1), size: CGSize(width: width + 2, height: height + 2))
        // layer1.position = center
        
        if index != nil {
            layer.insertSublayer(layer1, at: UInt32(index!))
        } else {
            layer.addSublayer(layer1)
        }
    }
}
