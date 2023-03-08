//
//  RegularButton.swift
//  UBeer
//
//  Created by Lobster on 7.03.23.
//

import UIKit

final class RegularButton: UIButton {
    
    init(_ title: String) {
        super.init(frame: .zero)
        setupButton(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(_ title: String) {
        configuration = Configuration.filled()
        configuration?.attributedTitle = AttributedString(title)
        configuration?.attributedTitle?.font = .buttonText
        configuration?.attributedTitle?.foregroundColor = .black100
        layer.cornerRadius = 8.0
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.black, for: .normal)
        tintColor = .acc
    }
    
    
    
}



