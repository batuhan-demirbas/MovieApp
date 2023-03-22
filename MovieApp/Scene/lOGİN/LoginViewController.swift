//
//  LoginViewController.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 7.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPassword: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        
    }
    
    func prepareView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped(_:)))
        forgotPassword.addGestureRecognizer(tapGesture)
    }
   
    
    @objc func forgotPasswordTapped(_ sender: UITapGestureRecognizer) {
        // Perform the desired action when the label is tapped
        if let forgotPasswordVC = storyboard?.instantiateViewController(withIdentifier: "forgotPasswordViewController") as? ForgotPasswordViewController {
            forgotPasswordVC.modalPresentationStyle = .fullScreen
            present(forgotPasswordVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "tabBarController") as? TabBarController {
            tabBarVC.modalPresentationStyle = .fullScreen
            presentedViewController?.dismiss(animated: false)
            present(tabBarVC, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
