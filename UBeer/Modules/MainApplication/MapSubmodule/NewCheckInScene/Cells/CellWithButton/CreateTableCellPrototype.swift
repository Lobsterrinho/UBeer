//
//  CreateTableCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 24.04.23.
//

import UIKit
#warning("Figure out with baseProtocol")
//protocol BaseProtocol {
//    func getAvatar()
//}
//
//final class ProfileVM: BaseProtocol {
//    
//}

final class CreateTableCellPrototype: UITableViewCell {
    
    private weak var createButton: UIButton!
    
    private weak var delegate: ButtonTableCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
        setupSelectors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellDelegate(_ delegate: ButtonTableCellDelegate) {
        self.delegate = delegate
    }
    
    //MARK: - Setting up functionality Cell's button
    
    private func setupSelectors() {
        createButton.addTarget(self,
                               action: #selector(buttonDidTap),
                               for: .touchUpInside)
    }
    
    @objc private func buttonDidTap() {
        delegate?.buttonDidTap()
    }
    
    //MARK: - Setting up Cell UI elements
    private func setupViewsAndConstraints() {
        
        backgroundColor = .clear
        contentView.isUserInteractionEnabled = false
        
        setupCreateButton()
        setupCreateButtonConstraints()
    }
    
    private func setupCreateButton() {
        let button = RegularButton("Check In")
        addSubview(button)
        self.createButton = button
    }
    
    private func setupCreateButtonConstraints() {
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: self.topAnchor),
            createButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            createButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            createButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
