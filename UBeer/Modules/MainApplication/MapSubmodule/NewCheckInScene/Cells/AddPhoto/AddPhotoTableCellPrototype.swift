//
//  AddPhotoTableCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 24.04.23.
//

import Foundation
import UIKit

final class AddPhotoTableCellPrototype: UITableViewCell {

    private weak var attachPhotoButton: UIButton!
    
    var viewModel: AddPhotoTableCellVMProtocol!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
        
        backgroundColor = .clear
        contentView.isUserInteractionEnabled = false
        
        setupAttachPhotoButton()
        setupAttachPhotoButtonConstraints()
        setupSelectors()
    }
    
    private func setupSelectors() {
        attachPhotoButton.addTarget(self,
                                    action: #selector(attachPhotoButtonDidTap),
                                    for: .touchUpInside)
    }
    
    @objc private func attachPhotoButtonDidTap() {
        viewModel.addPhotoButtonDidTap()
    }
    
    private func setupAttachPhotoButton() {
        let button = UIButton()
        button.backgroundColor = .white
        let image = UIImage(systemName: "camera")
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: image!.size.width * 1.5, height: image!.size.height * 1.5))
        let scaledImage = renderer.image { _ in
            image?.draw(in: CGRect(origin: .zero, size: CGSize(width: image!.size.width * 1.5, height: image!.size.height * 1.5)))
        }
        button.setImage(scaledImage.withTintColor(.acc), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        self.attachPhotoButton = button
    }
    
    private func setupAttachPhotoButtonConstraints() {
        NSLayoutConstraint.activate([
            attachPhotoButton.topAnchor.constraint(equalTo: self.topAnchor),
            attachPhotoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            attachPhotoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            attachPhotoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
    
}
