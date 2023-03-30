//
//  Pages.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

enum Pages {
    case firstPage
    case secondPage
    case thirdPage
    
    var viewController: UIViewController {
        switch self {
        case .firstPage:
            return OnboardingPageList(image: UIImage(named: "Onboarding1") ?? UIImage(),
                                      titleText: "UBeer",
                                      descriprion: "Enjoy unique tastes, learn about new products, share your opinion with friends")
        case .secondPage:
            return OnboardingPageList(image: UIImage(named: "Onboarding2") ?? UIImage(),
                                      titleText: "UBeer",
                                      descriprion: "Scan your favorite beer and find out detailed information about it")
            
        case .thirdPage:
            return OnboardingPageList(image: UIImage(named: "Onboarding3") ?? UIImage(),
                                      titleText: "UBeer",
                                      descriprion: "Find places on the map that sell your favorite beer. Find out about availability and book your seats")
        }
    }
}


