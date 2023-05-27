//
//  LoginVC.swift
//  UBeer
//
//  Created by Lobster on 28.02.23.
//

import UIKit

final class LoginVC: UIViewController {
    
    private weak var imageView: UIImageView!
    private weak var titleLabel: UILabel!
    private weak var subtitleLabel: UILabel!
    private weak var loginTextField: UITextField!
    private weak var passwordTextField: UITextField!
    private weak var forgotPasswordButton: UIButton!
    private weak var loginButton: UIButton!
    private weak var registerButton: UIButton!
    
    private var viewModel: LoginVMProtocol
    
    init(viewModel: LoginVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.setupViewDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented in \(Self.self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsAndConstraints()
        setupActions()
        
        createRightViewSecureButton(textField: passwordTextField)
    }
}

extension LoginVC: LoginVMDelegate {
    
    func getEmail(_ email: String) {
        loginTextField.text = email
    }
}

//MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

extension LoginVC {
    //MARK: - Actions
    
    //Setup selectors for buttons
    private func setupActions() {
        loginButton.addTarget(self,
                              action: #selector(login),
                              for: .touchUpInside)
        
        registerButton.addTarget(self,
                                 action: #selector(openRegisterScene),
                                 for: .touchUpInside)
        
        forgotPasswordButton.addTarget(self,
                                       action: #selector(openForgotPasswordScene),
                                       for: .touchUpInside)
    }
    
    //Setup methods
    @objc private func login() {
        viewModel.login(email: loginTextField.text,
                        password: passwordTextField.text)
    }
    
    @objc private func openRegisterScene() {
        viewModel.openRegisterScene(email: loginTextField.text)
    }
    
    @objc private func openForgotPasswordScene() {
        viewModel.openForgotPasswordScene(email: loginTextField.text)
    }
    
    //Create rightView with eye button for en/disable sequre antry
    
    private func createRightViewSecureButton(textField: UITextField) {
        textField.isSecureTextEntry = true
        let secureButton = UIButton(type: .custom)
        secureButton.setupEyeButton()
        secureButton.addTarget(self,
                               action: #selector (securePasswordButtonDidTap),
                               for: .touchUpInside)
        textField.rightView = secureButton
        textField.rightViewMode = .always
    }
    
    @objc private func securePasswordButtonDidTap(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        sender.secureButtonToggle(isSecured: !passwordTextField.isSecureTextEntry)
    }
    
    //MARK: - setupViewsAndConstraints
    
    private func setupViewsAndConstraints() {
        
        view.backgroundColor = .white
        
        setupImageView()
        setupImageViewConstraints()
        
        setupTitleLabel()
        setupTitleLabelConstraints()
        
        setupSubtitleLabel()
        setupSubtitleLabelConstraints()
        
        setupLoginTextField()
        setupLoginTextFieldConstraints()
        
        setupPasswordTextField()
        setupPasswordTextFieldConstraints()
        
        setupForgotPasswordButton()
        setupForgotPasswordButtonConstraints()
        
        setupLoginButton()
        setupLoginButtonConstraints()
        
        setupRegisterButton()
        setupRegisterButtonConstraints()
    }
    
    //MARK: - Setup UI elements
    
    private func setupImageView() {
        let image = UIImageView()
        image.image = UIImage(named: "loginImage")
        view.addSubview(image)
        self.imageView = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.setupLabel(text: "Welcome back",
                         color: .black80,
                         fontName: .headline)
        view.addSubview(label)
        self.titleLabel = label
    }
    
    private func setupSubtitleLabel() {
        let label = UILabel()
        label.setupLabel(text: "Login to your account",
                         color: .black60,
                         fontName: .text)
        view.addSubview(label)
        self.subtitleLabel = label
    }
    
    private func setupLoginTextField() {
        let textField = RegularTextField("Email or username")
        view.addSubview(textField)
        textField.delegate = self
        self.loginTextField = textField
    }
    
    private func setupPasswordTextField() {
        let textField = RegularTextField("Password")
        view.addSubview(textField)
        textField.delegate = self
        self.passwordTextField = textField
    }
    
    private func setupForgotPasswordButton() {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        self.forgotPasswordButton = button
    }
    
    private func setupLoginButton() {
        let button = RegularButton("Login")
        view.addSubview(button)
        self.loginButton = button
    }
    
    private func setupRegisterButton() {
        let button = RegularButton("Register")
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.acc.cgColor
        button.layer.borderWidth = 2.0
        view.addSubview(button)
        self.registerButton = button
    }
    
    //MARK: - Setup constraints
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 30.0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                            constant: 10.0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupSubtitleLabelConstraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant: 5.0),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupLoginTextFieldConstraints() {
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,
                                                constant: 40.0),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            loginTextField.heightAnchor.constraint(equalToConstant: 44.0),
        ])
    }
    
    private func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,
                                                   constant: 20.0),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44.0),
        ])
    }
    
    private func setupForgotPasswordButtonConstraints() {
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                                      constant: 5.0),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                           constant: -20.0),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 21.0),
        ])
    }
    
    private func setupLoginButtonConstraints() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,
                                             constant: 50.0),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 20.0),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant: -20.0),
            loginButton.heightAnchor.constraint(equalToConstant: 44.0),
        ])
    }
    
    private func setupRegisterButtonConstraints() {
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor,
                                                constant: 12.0),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            registerButton.heightAnchor.constraint(equalToConstant: 44.0),
        ])
    }
}
