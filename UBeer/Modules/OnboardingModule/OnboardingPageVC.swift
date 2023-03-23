//
//  OnboardingVC.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import UIKit

final class OnboardingPageVC: UIPageViewController {
    
    private let skipButton = RegularButton("Skip")
    private let continueButton = RegularButton("Continue")
//    private var shouldHideSkipButton: Bool = false
    
    private var viewModel: OnboardingVMProtocol
    private var pageControl = UIPageControl()
    
    
    init(viewModel: OnboardingVMProtocol) {
        self.viewModel = viewModel
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        self.viewModel.setupViewDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupPageView(pageView: self, pageControl: pageControl)
        setupActions()
        setupViews()
    }
    
}

extension OnboardingPageVC: OnboardingVMDelegate {
    func shouldHideSkipButton(_ shouldHide: Bool) {
        skipButton.isHidden = shouldHide
        changeContinueButton(if: shouldHide)
    }
    
    
}

extension OnboardingPageVC {
    
    private func setupActions() {
        skipButton.addTarget(self, action: #selector(skipButtonDidTap), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func skipButtonDidTap() {
        viewModel.skipUnboarding()
    }
    
    @objc private func continueButtonDidTap() {
        viewModel.continueToNextPage()
    }
    
    private func changeContinueButton(if thirdPage: Bool) {
        if thirdPage {
            continueButton.configuration?.attributedTitle = AttributedString("Next")
        } else {
            continueButton.configuration?.attributedTitle = "Continue"
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        
//        skipButton.isHidden = shouldHideSkipButton
        
        
        skipButton.tintColor = .white
        skipButton.configuration?.attributedTitle?.foregroundColor = .acc
        
        view.addSubview(skipButton)
        view.addSubview(continueButton)
        
        setupConstraints()
    }
    
    //Setup constraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            //Skip button
            skipButton.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: 79.0),
            skipButton.widthAnchor.constraint(equalToConstant: 60.0),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -20.0),
            skipButton.heightAnchor.constraint(equalToConstant: 30.0),
            
            //Continue button
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            continueButton.heightAnchor.constraint(equalToConstant: 50.0),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                   constant: -53.0)
        ])
    }
    
}



