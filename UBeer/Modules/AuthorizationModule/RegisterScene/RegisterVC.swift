//
//  RegisterVC.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterVC: UIViewController {
    
    private let imageView = UIImageView()
    private let upperTextLabel = UILabel()
    private let lowerTextLabel = UILabel()
    private let usernameTextField = RegularTextField("Username")
    private let emailTextField = RegularTextField("Email")
    private let passwordTextField = RegularTextField("Password")
    private let agreementButton = UIButton()
    private let registerButton = RegularButton("Register")
    
    private var viewModel: RegisterVMProtocol
    
    init(viewModel: RegisterVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupActions()
        
        createRightViewSecureButton(textField: passwordTextField)
        
        bind()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            viewModel.finish(shouldMovetoParentVC: false)
        }
    }
    
}

extension RegisterVC {
    
    private func bind() {
        emailTextField.text = viewModel.email
    }
    
    private func createRightViewSecureButton(textField: UITextField) {
        textField.isSecureTextEntry = true
        let secureButton = UIButton(type: .custom)
        secureButton.setupEyeButton()
        secureButton.addTarget(self, action: #selector (securePasswordButtonDidTap),
                         for: .touchUpInside)
        textField.rightView = secureButton
        textField.rightViewMode = .always
    }
    
    @objc private func securePasswordButtonDidTap(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        sender.secureButtonToggle(isSecured: !passwordTextField.isSecureTextEntry)
    }
    
    private func setupActions() {
        registerButton.addTarget(self,
                                 action: #selector(registerDidTap),
                                 for: .touchUpInside)
    }
    
    @objc private func registerDidTap() {
        viewModel.register(email: emailTextField.text,
                           password: passwordTextField.text)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        imageView.image = UIImage(named: "loginImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        upperTextLabel.setupLabel(text: "Create an account",
                                  color: .black80,
                                  fontName: .headline)
        
        lowerTextLabel.setupLabel(text: "Create your new account",
                                  color: .black60,
                                  fontName: .text)
    
        agreementButton.setTitle("I agree to Terms & Conditions and Privacy Policy", for: .normal)
        agreementButton.setTitleColor(.gray, for: .normal)
        agreementButton.titleLabel?.font = .systemFont(ofSize: 14.0)
        agreementButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(upperTextLabel)
        view.addSubview(lowerTextLabel)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(agreementButton)
        view.addSubview(registerButton)
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
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor,
                                                   constant: 20.0),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            emailTextField.heightAnchor.constraint(equalToConstant: 48.0),
            
            //Password texField
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,
                                                   constant: 20.0),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48.0),
            
            //
            agreementButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                             constant: 5.0),
            agreementButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 20.0),
            agreementButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant: -20.0),
            agreementButton.heightAnchor.constraint(equalToConstant: 21.0),
            
            //Register button
            registerButton.topAnchor.constraint(equalTo: agreementButton.bottomAnchor,
                                                constant: 20.0),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            registerButton.heightAnchor.constraint(equalToConstant: 48.0)
            
        ])
        
    }
    
}
