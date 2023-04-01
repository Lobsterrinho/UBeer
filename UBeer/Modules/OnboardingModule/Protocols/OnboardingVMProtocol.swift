//
//  OnboardingVMProtocol.swift
//  UBeer
//
//  Created by Lobster on 18.03.23.
//

import UIKit

protocol OnboardingVMProtocol {
    
    func setupViewDelegate(_ delegate: OnboardingVMDelegate)
    func setupPageView(pageView: UIPageViewController)
    func getPageCount() -> Int
    func pageControllerDidTap(_ pageControl: UIPageControl)
    func listToNextPage()
    func openMainApp()
}
