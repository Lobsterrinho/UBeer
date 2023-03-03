//
//  RegisterVC.swift
//  UBeer
//
//  Created by Lobster on 1.03.23.
//

import UIKit

final class RegisterVC: UIViewController {
    
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
        
        view.backgroundColor = .mainOrange
        setupViews()
    }
    
    private func registerDidTap() {
        viewModel.register()
    }
    
    
}

extension RegisterVC {
    
    private func setupViews() {
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }
    
}
