//
//  HomeVC.swift
//  UBeer
//
//  Created by Lobster on 23.03.23.
//

import UIKit

final class ProfileVC: UIViewController {
    
    private let avatarImage = UIImageView()
    private let checkInView = UIView()
    private let checkInLabel = UILabel()
    private let nameLabel = UILabel()
    private let locationLabel = UILabel()
    
    private var viewModel: ProfileVMProtocol
    
    init(viewModel: ProfileVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        requiredInit()
    }
    
    private func requiredInit() {
        tabBarItem = UITabBarItem(title: "Profile",
                                  image: UIImage(named: "personIcon"),
                                  selectedImage: UIImage(named: "personIconFill"))
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0,
                                                      vertical: 5.0)
        tabBarItem.imageInsets = UIEdgeInsets(top: 5.0,
                                              left: 0.0,
                                              bottom: -5.0,
                                              right: 0.0)
        navigationController?.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelectors()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
        avatarImage.clipsToBounds = true
    }
    
}

extension ProfileVC {
    
    private func setupSelectors() {
        
    }
    
    private func setupViews() {
        view.backgroundColor = .mainWhite
        
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.acc.cgColor
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.setupLabel(text: "Nickname here",
                             color: .black100,
                             fontName: .headline2)
        
        locationLabel.setupLabel(text: "Location here",
                                 color: .black80,
                                 fontName: .DescriptionText)
        
        view.addSubview(avatarImage)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        
        setConstraints()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Profile"
        let settingsButton = UIBarButtonItem()
        settingsButton.image = UIImage(systemName: "gearshape")
        navigationItem.rightBarButtonItem = settingsButton
        navigationItem.rightBarButtonItem?.tintColor = .black100
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 112.0),
//            avatarImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,
//                                                  constant: 113.0),
            avatarImage.heightAnchor.constraint(equalToConstant: 168.0),
            avatarImage.widthAnchor.constraint(equalToConstant: 168.0),
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor,
                                           constant: 6.0),
            
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)
            
            
            
            
        ])
    }
    
}
