//
//  OnboardingAdapter.swift
//  UBeer
//
//  Created by Lobster on 20.03.23.
//

import UIKit

final class OnboardingAdapter: NSObject, OnboardingAdapterProtocol {
    
    private weak var pageView: UIPageViewController?
    private var pages: [UIViewController] = []
    private weak var delegate: OnboardingAdapterPageDelegate?
    
    func setupPageView(pageView: UIPageViewController,
                       pages: [Pages]) {
        self.pageView = pageView
        self.pages = pages.map { page -> UIViewController in
            return page.viewController
        }
        
        setupPageViewController()
    }
    
    private func setupPageViewController() {
        pageView?.dataSource = self
        pageView?.delegate = self
        setupPageControlAction()
    }
    
    private func setupPageControlAction() {
        pageView?.setViewControllers([pages[pages.startIndex]],
                                     direction: .forward,
                                     animated: true,
                                     completion: nil)
    }
    
    
    func setupOnboardingAdapterPageDelegate(_ delegate: OnboardingAdapterPageDelegate) {
        self.delegate = delegate
    }
}
//MARK: - Methods
extension OnboardingAdapter {
    
    func pageControllerDidTap(_ currentPage: Int) {
        pageView?.setViewControllers([pages[currentPage]],
                                     direction: .forward,
                                     animated: true,
                                     completion: nil)
        delegate?.setCurrentIndex(currentPage)
   }
    
    func listToNextPage() {
        guard let pageView = pageView else { return }
        
        guard let currentPage = pageView.viewControllers?[0] else { return }
        guard let nextPage = pageView.dataSource?.pageViewController(pageView, viewControllerAfter: currentPage) else { return }
        if let index = pages.firstIndex(of: nextPage) {
            delegate?.setCurrentIndex(index)
        }
        pageView.setViewControllers([nextPage],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
    }
}

//MARK: - UIPageViewControllerDelegate
extension OnboardingAdapter: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentPageIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        delegate?.setCurrentIndex(currentPageIndex)
    }

}

//MARK: - UIPageViewControllerDataSource
extension OnboardingAdapter: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? OnboardingPageList else { return nil }
        if let index = pages.firstIndex(of: viewController) {
            if index > 0 {
                return pages[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? OnboardingPageList else { return nil }
        if let index = pages.firstIndex(of: viewController) {
            if index < pages.count - 1 {
                return pages[index + 1]
            }
        }
        return nil
    }
    
    
}
