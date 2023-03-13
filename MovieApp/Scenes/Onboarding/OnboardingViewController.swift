//
//  OnboardingViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 4.03.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let backgroundContent = ["onboarding.1", "onboarding.2", "onboarding.3"]
    let titleContent = ["Unlock the Magic of Movies", "Create Your Ultimate Movie Night", "Lights, Camera, Explore!"]
    let descriptionContent = ["Welcome to our movie app, where you can experience the magic of movies in a whole new way.", "Our movie app is the ultimate destination for movie lovers, offering a diverse collection of films from all genres and eras.", "Discover new films, track favorites, and explore cinema with our innovative movie tracker. Begin your movie journey today!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControlSetup()
        button.configuration?.image = UIImage(named: "right-icon")
    }

    func pageControlSetup() {
        pageControl.numberOfPages = 3
        pageControl.setIndicatorImage(UIImage(named: "currentPageIndicator"), forPage: pageControl.currentPage)
        
    }
    
    @IBAction func pageControlAction(_ sender: UIPageControl) {
        settingsPageControl()
        
    }
    
    @IBAction func tapButton( sender: UIButton) {
        settingsPageControl()
        pageControl.currentPage += 1
        background.image = UIImage(named: backgroundContent[pageControl.currentPage])
        titleLabel.text = titleContent[pageControl.currentPage]
        descriptionLabel.text = descriptionContent[pageControl.currentPage]
        
        
    }
    
    func settingsPageControl() {
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            
            if let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
                signUpVC.modalPresentationStyle = .fullScreen
                present(signUpVC, animated: true, completion: nil)
            }
            
        } else {
            
            pageControl.setIndicatorImage(UIImage(named: "currentPageIndicator"), forPage: pageControl.currentPage + 1)
            
            
            for page in 0..<pageControl.numberOfPages where page != pageControl.currentPage + 1 {
                pageControl.setIndicatorImage(UIImage(named: "pageIndicator"), forPage: page)
            }
            
        }
    }
    
}


