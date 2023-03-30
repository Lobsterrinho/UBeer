//
//  OnboardingVC.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import UIKit

final class OnboardingPageVC: UIPageViewController {
    
    private weak var skipButton: UIButton!
    private weak var continueButton: UIButton!
    private weak var pageControl: UIPageControl!
    private var lastPage: Bool {
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            return true
        }
        return false
    }
    
    private var viewModel: OnboardingVMProtocol
    
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
        viewModel.setupPageView(pageView: self)
        
        setupViewsAndConstraints()
        setupActions()
    }
    
}

//MARK: - OnboardingVMDelegate
extension OnboardingPageVC: OnboardingVMDelegate {
    
    func setCurrentPageIndex(_ index: Int) {
        
        pageControl.currentPage = index
        changeButtonAndHideSkip(lastPage)
    }
}

//MARK: - Methods and setups
extension OnboardingPageVC {
    
    //    change continue button by states (Default, Selected)
    private func setupActions() {
        skipButton.addTarget(self,
                             action: #selector(skipButtonDidTap),
                             for: .touchUpInside)
        pageControl.addTarget(self,
                              action: #selector(pageControllerDidTap(_:)),
                              for: .valueChanged)
        continueButton.addTarget(self,
                                 action: #selector(continueButtonDidTap),
                                 for: .touchUpInside)
    }
    
    
    @objc private func skipButtonDidTap() {
        viewModel.openMainApp()
    }
    
    @objc private func pageControllerDidTap(_ sender: UIPageControl) {
        viewModel.pageControllerDidTap(sender)
    }
    
    @objc private func continueButtonDidTap() {
        if !self.lastPage {
            viewModel.listToNextPage()
        } else {
            viewModel.openMainApp()
        }
    }
    
    @objc private func enterButtonDidTap() {
        viewModel.openMainApp()
    }
    
    //MARK: Should change lower button from continue to enter and reverse if displayed last page
    private func changeButtonAndHideSkip(_ lastPage: Bool) {
        if !lastPage {
            continueButton.setTitle("Continue", for: .normal)
            skipButton.isHidden = false
        } else {
            continueButton.setTitle("Enter", for: .normal)
            skipButton.isHidden = true
        }
    }
    
    //MARK: Set views and constraints
    private func setupViewsAndConstraints() {
        view.backgroundColor = .white
        
        setupSkipButton()
        setupSkipButtonConstraints()
        
        setupContinueButton()
        setupContinueButtonConstraints()
        
        setupPageControl()
        setupPageControlConstraints()
    }
    
    //MARK: Setup views
    private func setupSkipButton() {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.acc, for: .normal)
        button.titleLabel?.font = .headline3
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        self.skipButton = button
    }
    
    private func setupContinueButton() {
        let button = RegularButton("Continue")
        view.addSubview(button)
        self.continueButton = button
    }
    
    private func setupPageControl() {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .acc
        pageControl.pageIndicatorTintColor = .gray20
        pageControl.preferredIndicatorImage = UIImage(systemName: "circle.fill")
        pageControl.numberOfPages = viewModel.getPageCount()
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        self.pageControl = pageControl
    }
    
    //MARK: Setup constraints
    private func setupSkipButtonConstraints() {
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: 79.0),
            skipButton.widthAnchor.constraint(equalToConstant: 60.0),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -20.0),
            skipButton.heightAnchor.constraint(equalToConstant: 30.0)
        ])
    }
    
    private func setupContinueButtonConstraints() {
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 20.0),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
            continueButton.heightAnchor.constraint(equalToConstant: 50.0),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                   constant: -53.0)
        ])
    }
    
    private func setupPageControlConstraints() {
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor ),
            pageControl.heightAnchor.constraint(equalToConstant: 50.0),
            pageControl.bottomAnchor.constraint(equalTo: continueButton.topAnchor,
                                                constant: -100.0)
        ])
    }
}



