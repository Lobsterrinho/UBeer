//
//  PhotoTableCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 2.06.23.
//

import Foundation
import UIKit

final class PhotoTableCellPrototype: UITableViewCell {
    
    #warning("Wrong constraints calculation")
    
    private weak var cellButton: UIButton!
    private weak var selectedImageView: UIImageView!
    private weak var deleteImageButton: UIButton!
    
    var viewModel: ButtonTableCellBaseProtocol!
    
    private weak var delegate: ButtonTableCellDelegate?
    private weak var deleteDelegate: DeleteButtonTableCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting up cell from adapter
    func setupButtonImage(imageName: String) {
        let scaledImage = UIImage.makeScaledImage(imageName: imageName)
        cellButton.setImage(scaledImage, for: .normal)
        cellButton.backgroundColor = .white
        cellButton.tintColor = .acc
        cellButton.setTitle(nil, for: .normal)
    }
    
    func setupSelectedImage(image: UIImage?) {
        selectedImageView.image = image
        deleteImageButton.isHidden = false
        recalculateConstraints()
    }
    
    //MARK: - Setting up delegates
    
    func setupCellDelegate(_ delegate: ButtonTableCellDelegate) {
        self.delegate = delegate
    }
    
    func setupCellDeleteDelegate(_ delegate: DeleteButtonTableCellDelegate) {
        self.deleteDelegate = delegate
    }
    
    //MARK: - Setting up functionality Cell's buttons
    
    @objc private func buttonDidTap() {
        delegate?.buttonDidTap(cellButton)
    }
    
    @objc private func deleteSelectedImage() {
        selectedImageView.image = nil
        deleteImageButton.isHidden = true
        deleteDelegate?.deleteButtonDidTap()
        recalculateConstraints()
    }
    
    private func recalculateConstraints() {
        self.layoutIfNeeded()
        if selectedImageView.image != nil {
            setupRecalculatedSelectedImageViewConstraints()
            self.layoutIfNeeded()
        } else {
            setupSelectedImageViewConstraints()
            self.layoutIfNeeded()
        }
    }
    
    //MARK: - Setting up Cell UI elements
    private func setupViewsAndConstraints() {
        
        contentView.isUserInteractionEnabled = false
        
        setupButton()
        setupButtonConstraints()
        
        setupSelectedImageView()
        setupSelectedImageViewConstraints()
        
        setupDeleteImageButton()
        setupDeleteImageButtonConstraints()
    }
    
    //MARK: - Setting up UI elements
    
    private func setupButton() {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.acc.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        self.cellButton = button
        cellButton.addTarget(self,
                             action: #selector(buttonDidTap),
                             for: .touchUpInside)
    }
    
    private func setupSelectedImageView() {
        let imageView = UIImageView()
        imageView.image = nil
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        addSubview(imageView)
        self.selectedImageView = imageView
    }
    
    private func setupDeleteImageButton() {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        button.tintColor = .acc
        button.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        self.deleteImageButton = button
        deleteImageButton.addTarget(self,
                                    action: #selector(deleteSelectedImage),
                                    for: .touchUpInside)
        deleteImageButton.isHidden = true
    }
    
    //MARK: - Setting up constraints
    
    private func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            cellButton.heightAnchor.constraint(equalToConstant: 48.0),
            cellButton.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: 1.0),
            cellButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: 1.0),
            cellButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: -1.0)
        ])
    }
    
    private func setupRecalculatedSelectedImageViewConstraints() {
        let widthAndHeight = self.frame.width - 40.0
        NSLayoutConstraint.activate([
            selectedImageView.heightAnchor.constraint(equalToConstant: widthAndHeight),
            selectedImageView.widthAnchor.constraint(equalToConstant: widthAndHeight),
            selectedImageView.topAnchor.constraint(equalTo: self.topAnchor,
                                                   constant: 68.0),
            selectedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                       constant: 20.0),
            selectedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                        constant: -20.0),
            selectedImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                      constant: -20.0)
        ])
    }
    
    private func setupSelectedImageViewConstraints() {
        
        NSLayoutConstraint.activate([
            selectedImageView.heightAnchor.constraint(equalToConstant: 48.0),
            selectedImageView.topAnchor.constraint(equalTo: cellButton.topAnchor),
            selectedImageView.leadingAnchor.constraint(equalTo: cellButton.leadingAnchor),
            selectedImageView.trailingAnchor.constraint(equalTo: cellButton.trailingAnchor),
            selectedImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupDeleteImageButtonConstraints() {
        let widthAndHeight = 40.0
        NSLayoutConstraint.activate([
            deleteImageButton.heightAnchor.constraint(equalToConstant: widthAndHeight),
            deleteImageButton.widthAnchor.constraint(equalToConstant: widthAndHeight),
            deleteImageButton.topAnchor.constraint(equalTo: selectedImageView.topAnchor),
            deleteImageButton.trailingAnchor.constraint(equalTo: selectedImageView.trailingAnchor)
        ])
    }
}
