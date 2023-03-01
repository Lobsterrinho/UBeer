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
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let forgotPasswordButton = UIButton()
    private let loginButton = UIButton()
    
    
    
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
    }
    
    //MARK: - Actions
    
    private func login() {
        viewModel.login()
    }
    
    private func openRegisterVC() {
        viewModel.openRegisterScene()
    }
    
    private func openForgotPasswordVC() {
        viewModel.openForgotPasswordScene()
    }
    
}

extension LoginVC {
    
    private func setupViews() {
        view.backgroundColor = .white
        
        let leftView = UIView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: 15, height: loginTextField.frame.size.height))
        
        imageView.image = UIImage(named: "loginImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.text = "Welcome back"
        welcomeLabel.textColor = .blackText
        welcomeLabel.font = .systemFont(ofSize: 34.0, weight: .bold)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loginLabel.text = "Login to your account"
        loginLabel.textColor = .grayText
        loginLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.placeholder = "E-mail or username"
        loginTextField.backgroundColor = .white
        loginTextField.layer.cornerRadius = 8.0
        loginTextField.layer.borderWidth = 1.0
        loginTextField.leftView = leftView
        loginTextField.leftViewMode = .always
        loginTextField.layer.borderColor = UIColor.systemGray3.cgColor
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 8.0
        passwordTextField.layer.borderWidth = 1.0
//        passwordTextField.leftView = leftView
        passwordTextField.layer.borderColor = UIColor.systemGray3.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.setTitleColor(.gray, for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 14.0)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.layer.cornerRadius = 8.0
        loginButton.backgroundColor = .mainOrange
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(welcomeLabel)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: 30.0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                       constant: 10.0),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,
                                       constant: 5.0),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor,
                                                constant: 40.0),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            loginTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,
                                                   constant: 20.0),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                                      constant: 5.0),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                           constant: -20.0),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20.0),
            
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,
                                             constant: 50.0),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 20.0),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant: -20.0),
            loginButton.heightAnchor.constraint(equalToConstant: 44.0)
            
        ])
        
    }
    
    
}
