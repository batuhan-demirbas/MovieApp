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

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        
    }
    
    func prepareView() {
        emailTextField.setLeftPaddingPoints(16)
        //emailTextField.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        //emailTextField.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    
        passwordTextField.setLeftPaddingPoints(16)
    }
    
    @objc func editingDidBegin() {
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(named: "stroke")?.cgColor

    }
    
    @objc func editingDidEnd() {
        emailTextField.layer.borderWidth = 0

    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showHome", sender: nil)
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
