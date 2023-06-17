//
//  UIButton+Extension.swift
//  UBeer
//
//  Created by Lobster on 16.03.23.
//

import UIKit

extension UIButton {
    
    func setupEyeButton() {
        self.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        self.tintColor = .black5
        self.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    func secureButtonToggle(isSecured: Bool){
        if isSecured {
            self.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            self.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
}
