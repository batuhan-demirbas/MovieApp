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
