//
//  OnboardingPageList.swift
//  UBeer
//
//  Created by Lobster on 20.03.23.
//

import UIKit

final class OnboardingPageList: UIViewController {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    
    private var image: UIImage
    private var titleText: String
    private var descriprion: String
    
    init(image: UIImage, titleText: String, descriprion: String) {
        self.image = image
        self.titleText = titleText
        self.descriprion = descriprion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension OnboardingPageList {
    
    private func setupViews() {
        view.backgroundColor = .white
        
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.setupLabel(text: titleText,
                              color: .black80,
                              fontName: .headline)
        
        descriptionLabel.setupLabel(text: descriprion,
                                    color: .black60,
                                    fontName: .text)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    //Setup constraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            //Image
            imageView.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: 239.0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Title
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                            constant: 65.0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Subtitle
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                  constant: 15.0),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: 40.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: -40.0)
        ])   
    }
}
