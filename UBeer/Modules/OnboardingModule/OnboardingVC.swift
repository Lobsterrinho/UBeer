//
//  OnboardingVC.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import UIKit

final class OnboardingVC: UIViewController {
    
    private var viewModel: OnbordingVMProtocol
    
    init(viewModel: OnbordingVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
    }
 

    
}
