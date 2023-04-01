//
//  RegularButton.swift
//  UBeer
//
//  Created by Lobster on 7.03.23.
//

import UIKit

final class RegularButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .highlitedButton : .acc
        }
    }
    
    init(_ title: String) {
        super.init(frame: .zero)
        setupButton(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(_ title: String) {

        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        setTitleColor(.black100, for: .normal)
        backgroundColor = .acc
        layer.cornerRadius = 8.0
        titleLabel?.font = .buttonText
    }
    
    
    
}



