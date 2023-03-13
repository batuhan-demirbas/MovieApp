//
//  ViewController.swift
//  MovieApp
//
//  Created by Batuhan on 28.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchTextField! {
        didSet{
            searchBar.addIcon(direction: .Left, imageName: "search", Frame: CGRect(x: 16, y: 0, width: 24, height: 24))
            searchBar.attributedPlaceholder = NSAttributedString(
                string: "Movie, category...", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "primary.900") ?? .blue]
            )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

