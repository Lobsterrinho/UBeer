//
//  ForgotPasswordVC.swift
//  UBeer
//
//  Created by Lobster on 4.03.23.
//

import UIKit

final class ForgotPasswordVC: UIViewController {
    
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

    }

    @objc private func receiveNewPassword() {

    }

    private func setupViews() {
        view.backgroundColor = .mainOrange
        
        
        setupConstraints()
    }

    private func setupConstraints() {

    }

}
