//
//  BottomSheetHeaderView.swift
//  UBeer
//
//  Created by Lobster on 29.07.23.
//

import Foundation
import UIKit
import CoreLocation

final class BottomSheetHeaderView: UITableViewHeaderFooterView {
    
    private enum Consts {
        static let topAndBotSpace: CGFloat = 10
        static let defaultSpace: CGFloat = 20
        static let iconWidthAndHeight: CGFloat = 40
        static let buttonWidthAndHeight: CGFloat = 30
        static let buttonCornerRadius: CGFloat = buttonWidthAndHeight / 2
        static let dismissButtonImage: String = "xmark"
        static let stringDistanceFormat: String = "%.2f"
        static let metresToPoint: String = "m to point"
    }
    
    private weak var distanceToPointLabel: UILabel!
    private weak var iconImage: UIImageView!
    private weak var dismissSheetButton: UIButton!
    
    private weak var delegate: BottomSheetHeaderDelegate?
    
    
    init(reuseIdentifier: String) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
        
        setupIconImage()
        setupIconImageConstraints()
        
        setupDismissSheetButton()
        setupDismissSheetButtonConstraints()
        
        
        setupDistanceToPointLabel()
        setupDistanceToPointLabelConstraints()
    }
    
    func setupDelegate(_ delegate: BottomSheetHeaderDelegate) {
        self.delegate = delegate
    }
    
    func setup(distanceToPoint: CLLocationDistance,
               imageName: String) {
        iconImage.image = UIImage(named: imageName) ?? UIImage(systemName: imageName)
        distanceToPointLabel.text = String(
            format: Consts.stringDistanceFormat,
            distanceToPoint
        ) + Consts.metresToPoint
    }
    
    @objc private func dismissSheetButtonDidPushed() {
        delegate?.dismissButtonDidTap()
    }
    
    private func setupIconImage() {
        let imageView = UIImageView()
        imageView.tintColor = .black100
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        self.iconImage = imageView
    }
    
    private func setupDistanceToPointLabel() {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.headline3
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        self.distanceToPointLabel = label
    }
    
    private func setupDismissSheetButton() {
        let button = UIButton(type: .system)
        button.backgroundColor = .black80
        let image = UIImage(systemName: Consts.dismissButtonImage)
        button.setImage(image, for: .normal)
        button.tintColor = .mainWhite
        button.layer.cornerRadius = Consts.buttonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        self.dismissSheetButton = button
        dismissSheetButton.addTarget(self,
                                     action: #selector(dismissSheetButtonDidPushed),
                                     for: .touchUpInside)
    }
    
    private func setupIconImageConstraints() {
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: self.topAnchor,
                                           constant: Consts.topAndBotSpace),
            iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                               constant: Consts.defaultSpace),
            iconImage.heightAnchor.constraint(equalToConstant: Consts.iconWidthAndHeight),
            iconImage.widthAnchor.constraint(equalToConstant: Consts.iconWidthAndHeight),
            iconImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                              constant: -Consts.topAndBotSpace),
        ])
    }
    
    private func setupDismissSheetButtonConstraints() {
        NSLayoutConstraint.activate([
            dismissSheetButton.heightAnchor.constraint(equalToConstant: Consts.buttonWidthAndHeight),
            dismissSheetButton.widthAnchor.constraint(equalToConstant: Consts.buttonWidthAndHeight),
            dismissSheetButton.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            dismissSheetButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                         constant: -Consts.defaultSpace),
        ])
    }
    
    private func setupDistanceToPointLabelConstraints() {
        NSLayoutConstraint.activate([
            distanceToPointLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,
                                                          constant: Consts.defaultSpace),
            distanceToPointLabel.trailingAnchor.constraint(equalTo: dismissSheetButton.leadingAnchor,
                                                           constant: -Consts.defaultSpace),
            distanceToPointLabel.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
        ])
    }
}
