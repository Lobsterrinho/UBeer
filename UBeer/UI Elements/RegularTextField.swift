//
//  CustomTextField.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class RegularTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0.0,
                                       left: 20.0,
                                       bottom: 0.0,
                                       right: 0.0)
    
    init(_ placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    private func setupTextField(_ placeholder: String) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black5]
        )
        backgroundColor = .white
        layer.cornerRadius = 8.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black5.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
