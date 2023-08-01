//
//  DistanceTableCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import UIKit

final class BottomSheetTableViewCell: UITableViewCell {
    
    private weak var titleLabel: UILabel!
//    private weak var iconImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
        
        backgroundColor = .white
        
//        setupIconView()
//        setupIconViewConstraints()
//
        setupTitleLabel()
        setupTitleLabelConstraints()
    }
    
    func setup(checkInValue: String) {
        titleLabel.text = checkInValue
    }
    
//    private func setupIconView() {
//        let iconImageView = UIImageView()
//        iconImageView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(iconImageView)
//        self.iconImageView = iconImageView
//    }

    private func setupTitleLabel() {
        let label = UILabel()
        label.setupLabel(text: "Title",
                         color: .black100,
                         fontName: .text)
        addSubview(label)
        self.titleLabel = label
    }
    
//    private func setupIconViewConstraints() {
//        NSLayoutConstraint.activate([
//            iconImageView.topAnchor.constraint(equalTo: self.topAnchor,
//                                          constant: 9.0),
//            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
//                                              constant: 14.0),
//            iconImageView.widthAnchor.constraint(equalToConstant: 30.0),
//            iconImageView.heightAnchor.constraint(equalToConstant: 30.0)
//
//       ])
//    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: 9.0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: 14.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 30.0)
        ])
    }
    
    
    
}
