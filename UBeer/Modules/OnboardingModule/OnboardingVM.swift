//
//  OnboardingVM.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

protocol OnboardingVMDelegate: AnyObject {
    func shouldHideSkipButton(_ shouldHide: Bool)
}

import UIKit

final class OnboardingVM: OnboardingVMProtocol {
    
    var pages: [UIViewController] = [
        OnboardingPageList(image: UIImage(named: "Onboarding1") ?? UIImage(),
                           titleText: "UBeer",
                           descriprion: "Enjoy unique tastes, learn about new products, share your opinion with friends"),
        OnboardingPageList(image: UIImage(named: "Onboarding2") ?? UIImage(),
                           titleText: "UBeer",
                           descriprion: "Scan your favorite beer and find out detailed information about it"),
        OnboardingPageList(image: UIImage(named: "Onboarding3") ?? UIImage(),
                           titleText: "UBeer",
                           descriprion: "Find places on the map that sell your favorite beer. Find out about availability and book your seats"),
    ]
    
    private weak var coordinator: OnboardingCoordinatorProtocol?
    private var adapter: OnboardingAdapterProtocol
    private weak var delegate: OnboardingVMDelegate?
    
    init(coordinator: OnboardingCoordinatorProtocol,
         adapter: OnboardingAdapterProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.adapter.setupOnboardingAdapterPageDelegate(self)
    }
    
    func setupViewDelegate(_ delegate: OnboardingVMDelegate) {
        self.delegate = delegate
    }
    
    func skipUnboarding() {
        print("\(#function)")
    }
    
    func continueToNextPage() {
        adapter.nextPage()
    }
    
    func setupPageView(pageView: UIPageViewController, pageControl: UIPageControl) {
        adapter.setupPageView(pageView: pageView, pages: self.pages, pageControl: pageControl)
    }
}

extension OnboardingVM: OnboardingAdapterPageDelegate {
    
    func skipButtonShouldHide(_ shouldHide: Bool) {
        delegate?.shouldHideSkipButton(shouldHide)
    }
    
    
}
