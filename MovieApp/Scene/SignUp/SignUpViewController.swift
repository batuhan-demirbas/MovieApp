//
//  SignUpViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 6.03.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var checkbox: Checkbox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.isEnabled = false
        
        checkbox.checkValueChanged = { value in
            if value {
                self.signUpButton.isEnabled = true
            } else {
                self.signUpButton.isEnabled = false
            }
            
        }
        
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginViewController") as? LoginViewController {
            
            present(loginVC, animated: true)
        }
    }
    
}
