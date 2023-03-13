//
//  TabBarController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 11.03.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 20, y: tabBar.bounds.minY, width: view.frame.size.width - 40, height: 56), cornerRadius: 16).cgPath
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor(named: "Background")?.cgColor
        
        tabBar.layer.insertSublayer(layer, at: 0)
        
        if let items = tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
        
        tabBar.itemWidth = 30.0
        tabBar.frame.size.height = 56
        tabBar.itemPositioning = .centered
        tabBar.tintColor = UIColor(named: "TextColor")
        tabBar.unselectedItemTintColor = UIColor(named: "TextColor 3")
        tabBar.itemSpacing = 87
    }
}

extension TabBarController:  UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let items = tabBarController.tabBar.items else { return }
        let selectedItem = viewController.tabBarItem
        items.forEach { item in
            item.title = ""
        }
        for _ in items {
            switch selectedItem {
            case items[0]:
                selectedItem?.title = "Home"
            case items[1]:
                selectedItem?.title = "Discover"
            case items[2]:
                selectedItem?.title = "Profile"
            default:
                break
            }
            
        }
    }
    
}
