//
//  CustomTextField.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 10.03.2023.
//

import UIKit

class TextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.setLeftPaddingPoints(16)
        
        guard let placeholder = self.placeholder else {return}
        self.attributedPlaceholder = NSAttributedString(
            string: "\(placeholder)", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "primary.900") ?? .blue]
        )
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    @IBInspectable
    var cornerRadius:Double {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable
    var isSecure:Bool {
        set {
            isSecureTextEntry = newValue
            if newValue {

                let view = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 24))
                let button = UIButton(frame: CGRect(x: 16, y: 0, width: 24, height: 24))
                button.setImage(UIImage(named: "eye"), for: .normal)
                button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
                view.addSubview(button)
                rightView = view
                rightViewMode = .always
                
            }
        }
        get {
            return isSecureTextEntry
        }
    }

    @objc func togglePasswordVisibility() {
        isSecureTextEntry.toggle()
        if let button = self.rightView?.subviews.first as? UIButton {
            button.setImage(UIImage(named: isSecureTextEntry ? "eye" : "home" ), for: .normal)
        }
    }
    
    
}

extension TextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 1.3
        textField.layer.borderColor = UIColor(named: "primary.400")?.cgColor
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 0
        return true
    }
    
    
}
