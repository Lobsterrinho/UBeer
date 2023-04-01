//
//  RegisterVC.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterVC: UIViewController {
    
    private weak var imageView: UIImageView!
    private weak var titleLabel: UILabel!
    private weak var subtitleLabel: UILabel!
    private weak var usernameTextField: UITextField!
    private weak var emailTextField: UITextField!
    private weak var passwordTextField: UITextField!
    private weak var agreementButton: UIButton!
    private weak var registerButton: UIButton!
    
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
        
        setupViewsAndConstraints()
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

//MARK: - UITextFieldDelegate
extension RegisterVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
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
    
    private func setupViewsAndConstraints() {
        
        view.backgroundColor = .white
        
        setupImageView()
        setupImageViewConstraints()
        
        setupTitleLabel()
        setupTitleLabelConstraints()
        
        setupSubtitleLabel()
        setupSubtitleLabelConstraints()
        
        setupUsernameTextField()
        setupUsernameTextFieldConstraints()
        
        setupEmailTextField()
        setupEmailTextFieldConstraints()
        
        setupPasswordTextField()
        setupPasswordTextFieldConstraints()
        
        setupAgreementButton()
        setupAgreementButtonConstraints()
        
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
        label.setupLabel(text: "Create an account",
                         color: .black80,
                         fontName: .headline)
        view.addSubview(label)
        self.titleLabel = label
    }
    
    private func setupSubtitleLabel() {
        let label = UILabel()
        label.setupLabel(text: "Create your new account",
                         color: .black60,
                         fontName: .text)
        view.addSubview(label)
        self.subtitleLabel = label
    }
    
    private func setupUsernameTextField() {
        let textField = RegularTextField("Username")
        view.addSubview(textField)
        textField.delegate = self
        self.usernameTextField = textField
    }
    
    private func setupEmailTextField() {
        let textField = RegularTextField("Email")
        view.addSubview(textField)
        textField.delegate = self
        self.emailTextField = textField
    }
    
    private func setupPasswordTextField() {
        let textField = RegularTextField("Password")
        view.addSubview(textField)
        textField.delegate = self
        self.passwordTextField = textField
    }
    
    private func setupAgreementButton() {
        let button = UIButton()
        button.setTitle("I agree to Terms & Conditions and Privacy Policy", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        self.agreementButton = button
    }
    
    private func setupRegisterButton() {
        let button = RegularButton("Register")
        view.addSubview(button)
        self.registerButton = button
    }
    
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: 30.0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
    
    private func setupUsernameTextFieldConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,
                                                constant: 40.0),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            usernameTextField.heightAnchor.constraint(equalToConstant: 44.0),
        ])
    }
    
    private func setupEmailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor,
                                                   constant: 20.0),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            emailTextField.heightAnchor.constraint(equalToConstant: 48.0),
        ])
    }
    
    private func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,
                                                   constant: 20.0),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 20.0),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -20.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48.0),
        ])
    }
    
    private func setupAgreementButtonConstraints() {
        NSLayoutConstraint.activate([
            agreementButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                             constant: 5.0),
            agreementButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 20.0),
            agreementButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant: -20.0),
            agreementButton.heightAnchor.constraint(equalToConstant: 21.0),
        ])
    }
    
    private func setupRegisterButtonConstraints() {
        NSLayoutConstraint.activate([
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
