//
//  TextFieldCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

protocol TextFieldTextDelegate: AnyObject {
    func textFromTextField(text: String, indexPath: IndexPath)
}

import UIKit

final class TextFieldCellPrototype: UITableViewCell {
    
    private weak var textField: UITextField!
    private weak var delegate: TextFieldTextDelegate?
    
    private var indexPath: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextDelegate(_ delegate: TextFieldTextDelegate) {
        self.delegate = delegate
    }
    
    func receiveIndexPath(_ indexPath: IndexPath) {
        self.indexPath = indexPath
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
            textField.heightAnchor.constraint(equalToConstant: 48.0),
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func animateColorChange(of view: UIView,
                                    to color: UIColor,
                                    with duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            view.backgroundColor = color
        }
    }
    
}

extension TextFieldCellPrototype: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let newText = textField.text else { return }
        if newText.isEmpty {
            animateColorChange(of: textField,
                               to: .systemPink.withAlphaComponent(0.2),
                               with: 0.2)
        } else {
            animateColorChange(of: textField,
                               to: .white,
                               with: 0.2)
        }
        guard let indexPath = self.indexPath else { return }
        delegate?.textFromTextField(text: newText,
                                    indexPath: indexPath)
    }
    
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let newText = textField.text else { return false }
            if newText.isEmpty {
                return !string.contains(where: { $0.isNumber }) && string != " "
            } else {
                return true
            }
        }
}
