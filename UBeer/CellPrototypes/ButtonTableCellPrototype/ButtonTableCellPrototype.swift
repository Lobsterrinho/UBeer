//
//  CreateTableCellPrototype.swift
//  UBeer
//
//  Created by Lobster on 24.04.23.
//

import UIKit

final class ButtonTableCellPrototype: UITableViewCell {
    
    private weak var cellButton: UIButton!
    
    #warning("why button change state only if i write in didSet")
    var acceptCheckIn: Bool = false {
        didSet {
            setupCellButton()
            setupCellButtonConstraints()
        }
    }
    var viewModel: ButtonTableCellBaseProtocol!
    
    private weak var delegate: ButtonTableCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
//        setupSelectors()
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
        
//        setupCellButton()
//        setupCellButtonConstraints()
    }
    
    func setupButtonImage(imageName: String) {
        cellButton.setTitle(nil, for: .normal)
        cellButton.backgroundColor = .acc
    }
    
    //    private func setupEnabledCellButton() {
    //        let button = UIButton(type: .system)
    //        button.setTitle("Button", for: .normal)
    //
    //        button.layer.cornerRadius = 8.0
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        addSubview(button)
    //        self.cellButton = button
    //    }
    
    private func setupCellButton() {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.titleLabel?.font = .buttonText
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        if acceptCheckIn {
            button.setTitleColor(.black100, for: .normal)
            button.backgroundColor = .acc
            button.isEnabled = true
        } else {
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black5
            button.isEnabled = false
        }
        addSubview(button)
        self.cellButton = button
        self.cellButton.addTarget(self,
                             action: #selector(buttonDidTap),
                             for: .touchUpInside)
    }
    
    private func setupButtonWithImage(imageName: String) {
        let image = UIImage.makeScaledImage(imageName: imageName, scale: 1.5)
        cellButton.backgroundColor = .white
        cellButton.tintColor = .acc
        cellButton.setImage(image, for: .normal)
        cellButton.setTitle(nil, for: .normal)
    }
    
    private func setupCellButtonConstraints() {
        NSLayoutConstraint.activate([
            cellButton.heightAnchor.constraint(equalToConstant: 48.0),
            cellButton.topAnchor.constraint(equalTo: self.topAnchor),
            cellButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
