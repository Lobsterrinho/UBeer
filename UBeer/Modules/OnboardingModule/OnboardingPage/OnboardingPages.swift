//
//  OnboardingPages.swift
//  UBeer
//
//  Created by Lobster on 20.03.23.
//

import UIKit

final class OnboardingPages: UIViewController {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let continueButton = RegularButton("Continue")
    
    
    
}

extension OnboardingPages {
    
    private func setupViews() {
        view.backgroundColor = .white
        
        imageView.image = UIImage(named: "loginImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.setupLabel(text: "Welcome back",
                                color: .black80,
                                fontName: .headline)
        
        descriptionLabel.setupLabel(text: "Login to your account",
                              color: .black60,
                              fontName: .text)
        
        
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(continueButton)
        setupConstraints()
    }
    
    //Setup constraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            //Image
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: 30.0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                       constant: 10.0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Login label
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                       constant: 5.0),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            //Login button
            continueButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,
                                             constant: 50.0),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 20.0),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant: -20.0),
            continueButton.heightAnchor.constraint(equalToConstant: 44.0),
        ])
        
    }
    
    
}
