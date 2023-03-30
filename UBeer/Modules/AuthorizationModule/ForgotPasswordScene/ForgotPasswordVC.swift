//
//  ForgotPasswordVC.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordVC: UIViewController {
    
    private weak var imageView: UIImageView!
    private weak var titleLabel: UILabel!
    private weak var subtitleLabel: UILabel!
    private weak var usernameOrEmailTextField: UITextField!
    private weak var changePasswordButton: UIButton!
    
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
        
        setupViewsAndConstraints()
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

//MARK: - UITextFieldDelegate
extension ForgotPasswordVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

extension ForgotPasswordVC {
    
    private func bind() {
        usernameOrEmailTextField.text = viewModel.email
    }
    
    private func setupSelectors() {
        changePasswordButton.addTarget(self,
                                       action: #selector(changePasswordDidTap),
                                       for: .touchUpInside)
    }
    
    @objc private func changePasswordDidTap() {
        viewModel.forgotPassword(email: usernameOrEmailTextField.text)
    }
    
    private func setupViewsAndConstraints() {
        view.backgroundColor = .white
        
        setupImageView()
        setupImageViewConstraints()
        
        setupTitleLabel()
        setupTitleLabelConstraints()
        
        setupSubtitleLabel()
        setupSubtitleLabelConstraints()
        
        setupUsernameOrEmailTextField()
        setupUsernameOrEmailTextFieldConstraints()
        
        setupChangeButton()
        setupChangeButtonConstraints()
    }
    
    private func setupImageView() {
        let image = UIImageView()
        image.image = UIImage(named: "loginImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        self.imageView = image
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.setupLabel(text: "Forgot password?",
                         color: .black80,
                         fontName: .headline)
        view.addSubview(label)
        self.titleLabel = label
    }
    
    private func setupSubtitleLabel() {
        let label = UILabel()
        label.setupLabel(text: "Enter your username or email",
                         color: .black60,
                         fontName: .text)
        view.addSubview(label)
        self.subtitleLabel = label
    }
    
    private func setupUsernameOrEmailTextField() {
        let textField = RegularTextField("Username or email")
        view.addSubview(textField)
        textField.delegate = self
        self.usernameOrEmailTextField = textField
    }
    
    private func setupChangeButton() {
        let button = RegularButton("Change")
        view.addSubview(button)
        self.changePasswordButton = button
    }
    
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
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupUsernameOrEmailTextFieldConstraints() {
        
        NSLayoutConstraint.activate([
            usernameOrEmailTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,
                                                          constant: 40.0),
            usernameOrEmailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                              constant: 20.0),
            usernameOrEmailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                               constant: -20.0),
            usernameOrEmailTextField.heightAnchor.constraint(equalToConstant: 44.0),
        ])
    }
    
    private func setupChangeButtonConstraints() {
        
        NSLayoutConstraint.activate([
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
