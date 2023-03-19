//
//  ForgotPasswordViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 16.03.2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        if let verificationVC = storyboard?.instantiateViewController(withIdentifier: "verificationViewController") as? VerificationViewController {
            verificationVC.modalPresentationStyle = .fullScreen
            present(verificationVC, animated: true, completion: nil)
        }
    }
    
    
}
