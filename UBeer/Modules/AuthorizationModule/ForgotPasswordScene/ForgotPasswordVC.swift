//
//  ForgotPasswordVC.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordVC: UIViewController {
    
    private let imageView = UIImageView()
    private let upperTextLabel = UILabel()
    private let lowerTextLabel = UILabel()
    private let usernameOrEmailTextField = RegularTextField("Username or email")
    private let changePasswordButton = RegularButton("Change password")
    
    private var viewModel: ForgotPasswordVMProtocol
    
    init(viewModel: ForgotPasswordVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupSelectors()
        
        bind()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            viewModel.finish(shouldMoveToParent: false)
        }
    }
    
}

extension ForgotPasswordVC {
    
    private func bind() {
        usernameOrEmailTextField.text = viewModel.email
    }
    
}

extension ForgotPasswordVC {
    
    private func setupSelectors() {
        changePasswordButton.addTarget(self,
                                       action: #selector(changePasswordDidTap),
                                       for: .touchUpInside)
    }
    
    @objc private func changePasswordDidTap() {
        viewModel.forgotPassword(email: usernameOrEmailTextField.text)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        imageView.image = UIImage(named: "loginImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        upperTextLabel.setupLabel(text: "Forgot password?",
                                  color: .black80,
                                  fontName: .headline)
        
        lowerTextLabel.setupLabel(text: "Enter your username or email",
                                  color: .black60,
                                  fontName: .text)
        
        view.addSubview(imageView)
        view.addSubview(upperTextLabel)
        view.addSubview(lowerTextLabel)
        view.addSubview(usernameOrEmailTextField)
        view.addSubview(changePasswordButton)
        setupConstraints()
    }
    
    //Setup constraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            //Image
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 30.0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Upper label
            upperTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                                constant: 10.0),
            upperTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Lower label
            lowerTextLabel.topAnchor.constraint(equalTo: upperTextLabel.bottomAnchor,
                                                constant: 5.0),
            lowerTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Username textField
            usernameOrEmailTextField.topAnchor.constraint(equalTo: lowerTextLabel.bottomAnchor,
                                                          constant: 40.0),
            usernameOrEmailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                              constant: 20.0),
            usernameOrEmailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                               constant: -20.0),
            usernameOrEmailTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            //Change password button
            changePasswordButton.topAnchor.constraint(equalTo: usernameOrEmailTextField.bottomAnchor,
                                                      constant: 20.0),
            changePasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                          constant: 20.0),
            changePasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                           constant: -20.0),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 44.0)
            
        ])
        
    }
    
}
