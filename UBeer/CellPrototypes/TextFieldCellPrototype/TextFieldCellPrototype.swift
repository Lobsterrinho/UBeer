//
//  TextFieldCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import UIKit

final class TextFieldCellPrototype: UITableViewCell {
    
    private weak var textField: UITextField!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
        
        backgroundColor = .white
        contentView.isUserInteractionEnabled = false
        
        setupTextField()
        setupTextFieldConstraints()
    }
    
    func setup(item: String) {
        textField.placeholder = item
    }
    
    private func setupTextField() {
        let textField = RegularTextField("Title")
        textField.layer.cornerRadius = 10.0
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.delegate = self
        addSubview(textField)
        self.textField = textField
    }
    
    private func setupTextFieldConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

extension TextFieldCellPrototype: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
