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
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let confirmPasswordTextField = UITextField()
    private let changePasswordButton = UIButton()
    
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
    }
    
}

extension ForgotPasswordVC {

    private func setupSelectors() {
        changePasswordButton.addTarget(self,
                                 action: #selector(changePasswordDidTap),
                                 for: .touchUpInside)
    }
    
    @objc private func changePasswordDidTap() {
        viewModel.forgotPassword()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        imageView.image = UIImage(named: "loginImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        upperTextLabel.text = "Forgot password?"
        upperTextLabel.textColor = .blackText
        upperTextLabel.font = .systemFont(ofSize: 34.0, weight: .bold)
        upperTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        lowerTextLabel.text = "Enter your new password"
        lowerTextLabel.textColor = .grayText
        lowerTextLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        lowerTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        usernameTextField.placeholder = "Username"
        usernameTextField.backgroundColor = .white
        usernameTextField.layer.cornerRadius = 8.0
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.borderColor = UIColor.systemGray3.cgColor
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 8.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.systemGray3.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        confirmPasswordTextField.placeholder = "Confirm password"
        confirmPasswordTextField.backgroundColor = .white
        confirmPasswordTextField.layer.cornerRadius = 8.0
        confirmPasswordTextField.layer.borderWidth = 1.0
        confirmPasswordTextField.layer.borderColor = UIColor.systemGray3.cgColor
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        changePasswordButton.setTitle("Change password", for: .normal)
        changePasswordButton.setTitleColor(.black, for: .normal)
        changePasswordButton.layer.cornerRadius = 8.0
        changePasswordButton.backgroundColor = .mainOrange
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(upperTextLabel)
        view.addSubview(lowerTextLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
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
            usernameTextField.topAnchor.constraint(equalTo: lowerTextLabel.bottomAnchor,
                                                constant: 40.0),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            usernameTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            //Email textField
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor,
                                                   constant: 20.0),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            //Password texField
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                                   constant: 20.0),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            //Register button
            changePasswordButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor,
                                                constant: 20.0),
            changePasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            changePasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 44.0)
            
        ])
        
    }

}
