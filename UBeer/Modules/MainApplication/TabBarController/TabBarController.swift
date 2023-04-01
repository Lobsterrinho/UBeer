//
//  TabBarController.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarAppearance()
    }
    
    private func setTabBarAppearance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .acc
        tabBar.unselectedItemTintColor = .black100
    }
    
}
