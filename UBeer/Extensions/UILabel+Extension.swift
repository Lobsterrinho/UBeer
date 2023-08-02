//
//  UILabel+Extension.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

extension UILabel {
    
    func setupLabel(text: String?, color: UIColor, fontName: UIFont) {
        self.text = text
        self.textColor = color
        self.font = fontName
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}


