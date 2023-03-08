//
//  LoginVC.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginVC: UIViewController {
    
    private let imageView = UIImageView()
    private let welcomeLabel = UILabel()
    private let loginLabel = UILabel()
    private let loginTextField = RegularTextField("Email or username")
    private let passwordTextField = RegularTextField("Password")
    private let forgotPasswordButton = UIButton()
    private let loginButton = RegularButton("Login")
    private let registerButton = RegularButton("Register")
    
    
    
    private var viewModel: LoginVMProtocol
    
    init(viewModel: LoginVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented in \(Self.self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
    }
}

extension LoginVC {
    
//MARK: - Actions
    
    //Setup selectors for buttons
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(login),
                              for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(openRegisterScene),
                                 for: .touchUpInside)
        
        forgotPasswordButton.addTarget(self, action: #selector(openForgotPasswordScene),
                              for: .touchUpInside)
    }
    
    //Setup selectors
    @objc private func login() {
        viewModel.login()
        print("\(#function) \(Self.self)")
    }
    
    @objc private func openRegisterScene() {
        viewModel.openRegisterScene()
//        registerButton.backgroundColor = .black
        print("\(#function) \(Self.self)")
    }
    
    @objc private func openForgotPasswordScene() {
        viewModel.openForgotPasswordScene()
        print("\(#function) \(Self.self)")
    }
    
//MARK: - UI setup and constraints
    
    //Setup whole UI elements
    private func setupViews() {
        view.backgroundColor = .white
        
        imageView.image = UIImage(named: "loginImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.setupLabel(text: "Welcome back",
                                color: .black80,
                                fontName: .headline)
        
        loginLabel.setupLabel(text: "Login to your account",
                              color: .black60,
                              fontName: .text)
        
        
        
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.setTitleColor(.gray, for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 14.0)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(welcomeLabel)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
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
            
            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                       constant: 10.0),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Login label
            loginLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,
                                       constant: 5.0),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Login textField
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor,
                                                constant: 40.0),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            loginTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            //Password textField
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,
                                                   constant: 20.0),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            //Forgot password button
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                                      constant: 5.0),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                           constant: -20.0),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 21.0),
            
            //Login button
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,
                                             constant: 50.0),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 20.0),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant: -20.0),
            loginButton.heightAnchor.constraint(equalToConstant: 44.0),
            
            //Register button
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor,
                                                constant: 20.0),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            registerButton.heightAnchor.constraint(equalToConstant: 44.0),
            
        ])
        
    }
    
    
}
