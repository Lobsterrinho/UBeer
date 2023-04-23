//
//  SettingsTableViewCell.swift
//  UBeer
//
//  Created by Lobster on 2.04.23.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
    
    private weak var titleLabel: UILabel!
    private weak var iconView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
        
        backgroundColor = .white
        
        setupIconView()
        setupIconViewConstraints()
        
        setupTitleLabel()
        setupTitleLabelConstraints()
    }
    
    func setup(item: SettingsItem) {
        titleLabel.text = item.title
        iconView.image = item.image
    }
    
    private func setupIconView() {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconView)
        self.iconView = iconView
    }

    private func setupTitleLabel() {
        let label = UILabel()
        label.setupLabel(text: "Title",
                         color: .black100,
                         fontName: .text)
        addSubview(label)
        self.titleLabel = label
    }
    
    private func setupIconViewConstraints() {
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor,
                                          constant: 9.0),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                              constant: 14.0),
            iconView.widthAnchor.constraint(equalToConstant: 30.0),
            iconView.heightAnchor.constraint(equalToConstant: 30.0)
            
       ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: 9.0),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,
                                                constant: 14.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 30.0)
        ])
    }
    
    
    
}
