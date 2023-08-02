//
//  DistanceTableCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import UIKit

final class BottomSheetTableViewCell: UITableViewCell {
    
    private enum Consts {
        static let defaultSpace: CGFloat = 20
        static let topAndBotSpace: CGFloat = 10
    }
    
    
    
    private weak var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
        
        backgroundColor = .white
        
        setupTitleLabel()
        setupTitleLabelConstraints()
    }
    
    func setup(checkInValue: String) {
        titleLabel.text = checkInValue
    }

    private func setupTitleLabel() {
        let label = UILabel()
        label.setupLabel(text: nil,
                         color: .black100,
                         fontName: .subhead)
        addSubview(label)
        self.titleLabel = label
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: Consts.topAndBotSpace),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: Consts.defaultSpace),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: -Consts.defaultSpace),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                            constant: -Consts.topAndBotSpace)
        ])
    }
    
    
    
}
