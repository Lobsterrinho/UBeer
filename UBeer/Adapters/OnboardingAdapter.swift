//
//  OnboardingAdapter.swift
//  UBeer
//
//  Created by Lobster on 20.03.23.
//


protocol OnboardingAdapterPageDelegate: AnyObject {
    func skipButtonShouldHide(_ shouldHide: Bool)
}

import UIKit

final class OnboardingAdapter: NSObject, OnboardingAdapterProtocol {
    
    private weak var pageView: UIPageViewController?
    private var pages = [UIViewController]()
    private weak var pageControl: UIPageControl?
    private weak var currentPageDelegate: OnboardingAdapterPageDelegate?
    
    func setupPageView(pageView: UIPageViewController, pages: [UIViewController], pageControl: UIPageControl) {
        self.pageView = pageView
        self.pages = pages
        self.pageControl = pageControl
        setupPageViewController()
    }
    
    private func setupPageViewController() {
        pageView?.dataSource = self
        pageView?.delegate = self
        
        setupPageControlAction()
        setupPageControlUI()
        setupPageControlConstraints()
    }
    
    private func setupPageControlAction() {
        pageControl?.addTarget(self, action: #selector(pageControllerTapped(_:)), for: .valueChanged)
        pageView?.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func setupPageControlUI() {
        pageControl?.translatesAutoresizingMaskIntoConstraints = false
        pageControl?.currentPageIndicatorTintColor = .acc
        pageControl?.pageIndicatorTintColor = .gray20
        pageControl?.preferredIndicatorImage = UIImage(systemName: "circle.fill")
        pageControl?.numberOfPages = pages.count
        pageControl?.currentPage = 0
    }
    
    private func setupPageControlConstraints() {
        pageView?.view.addSubview(pageControl ?? UIPageControl())
        guard let pageControl = pageControl, let pageView = pageView else { return }
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: pageView.view.widthAnchor ),
            pageControl.heightAnchor.constraint(equalToConstant: 50.0),
            pageControl.bottomAnchor.constraint(equalTo: pageView.view.bottomAnchor, constant: -203.0)
        ])
    }
    
    @objc func pageControllerTapped(_ sender: UIPageControl) {
        pageView?.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func nextPage() {
        guard let currentIndex = pageControl?.currentPage else { return }
        if currentIndex <= 1 {
            pageControl?.currentPage = currentIndex + 1
            pageView?.setViewControllers([pages[currentIndex + 1]], direction: .forward, animated: true)
            
        }
        if currentIndex == 1 {
            currentPageDelegate?.skipButtonShouldHide(true)
        } else {
            currentPageDelegate?.skipButtonShouldHide(false)
        }
    }
    
    func setupOnboardingAdapterPageDelegate(_ currentPageDelegate: OnboardingAdapterPageDelegate) {
        self.currentPageDelegate = currentPageDelegate
    }
}

extension OnboardingAdapter: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl?.currentPage = currentIndex
        
        if currentIndex == pages.endIndex - 1 {
            currentPageDelegate?.skipButtonShouldHide(true)
        } else {
            currentPageDelegate?.skipButtonShouldHide(false)
        }
    }
}

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
