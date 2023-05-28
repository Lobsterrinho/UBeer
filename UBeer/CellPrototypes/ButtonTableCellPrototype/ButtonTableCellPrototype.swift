//
//  CreateTableCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 24.04.23.
//

import UIKit

final class ButtonTableCellPrototype: UITableViewCell {
    
    private weak var cellButton: UIButton!
    
    var viewModel: ButtonTableCellBaseProtocol!
    
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
    
    func setupButtonTitle(title: String?, imageName: String?) {
        if title != nil {
            cellButton.setTitle(title, for: .normal)
        } else if imageName != nil {
            guard let imageName = imageName else { return }
           setupButtonWithImage(imageName: imageName)
        }
    }
    
    //MARK: - Setting up functionality Cell's button
    
    private func setupSelectors() {
        cellButton.addTarget(self,
                               action: #selector(buttonDidTap),
                               for: .touchUpInside)
    }
    
    @objc private func buttonDidTap() {
        delegate?.buttonDidTap(cellButton)
    }
    
    //MARK: - Setting up Cell UI elements
    private func setupViewsAndConstraints() {
        
        backgroundColor = .clear
        contentView.isUserInteractionEnabled = false
        
        setupCreateButton()
        setupCreateButtonConstraints()
    }
    
    func setupButtonImage(imageName: String) {
        cellButton.setTitle(nil, for: .normal)
        cellButton.backgroundColor = .acc
    }
    
    private func setupCreateButton() {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black100, for: .normal)
        button.titleLabel?.font = .buttonText
        button.backgroundColor = .acc
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        self.cellButton = button
    }
    
    private func setupButtonWithImage(imageName: String) {
        let image = UIImage(systemName: imageName) ?? UIImage(systemName: "photo")!
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: image.size.width * 1.5, height: image.size.height * 1.5))
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: CGSize(width: image.size.width * 1.5, height: image.size.height * 1.5)))
        }
        let tintedImage = scaledImage.withTintColor(.acc)
        cellButton.backgroundColor = .white
        cellButton.tintColor = .acc
        cellButton.setImage(tintedImage, for: .normal)
        cellButton.setTitle(nil, for: .normal)
    }
    
    private func setupCreateButtonConstraints() {
        NSLayoutConstraint.activate([
            cellButton.topAnchor.constraint(equalTo: self.topAnchor),
            cellButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
