//
//  OnboardingVM.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import UIKit

final class OnboardingVM: OnboardingVMProtocol {
    
    var pages: [Pages] = [.firstPage, .secondPage, .thirdPage]
    
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
    
    func setupPageView(pageView: UIPageViewController) {
        adapter.setupPageView(pageView: pageView, pages: self.pages)
    }
}

//MARK: - Methods
extension OnboardingVM {
    
    func getPageCount() -> Int {
        return pages.count
    }
    
    func listToNextPage() {
        adapter.listToNextPage()
    }
    
    func pageControllerDidTap(_ pageControl: UIPageControl) {
        adapter.pageControllerDidTap(pageControl.currentPage)
    }
    
    func openMainApp() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: "shouldShowOnboarding")
        coordinator?.finish()
    }
}

//MARK: - OnboardingAdapterPageDelegate
extension OnboardingVM: OnboardingAdapterPageDelegate {
    
    func setCurrentIndex(_ index: Int) {
        delegate?.setCurrentPageIndex(index)
    }
    
    
}
