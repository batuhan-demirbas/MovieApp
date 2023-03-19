//
//  Checkbox.swift
//  MovieApp
//
//  Created by Batuhan Demirbaş on 10.03.2023.
//

import UIKit

class Checkbox: UIImageView {
    var isChecked: Bool = false {
        didSet {
            image = isChecked ? UIImage(named: "checkbox.filled") : UIImage(named: "checkbox")
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        // Set the initial state
        isChecked = false
        // Add a tap gesture recognizer
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapRecognizer)
    }

    var checkValueChanged:(_ value:Bool)->Void = {_ in}
    @objc private func handleTap() {
        isChecked = !isChecked
        checkValueChanged(isChecked)
    }
}

