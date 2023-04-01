//
//  MapVC.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class MapVC: UIViewController {
    
    private var viewModel: MapVMProtocol
    
    init(viewModel: MapVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        requiredInit()
    }
    
    private func requiredInit() {
        tabBarItem = UITabBarItem(title: "Map",
                                  image: UIImage(named: "mapIcon"),
                                  selectedImage: UIImage(named: "mapIconFill"))
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0,
                                                      vertical: 5.0)
        tabBarItem.imageInsets = UIEdgeInsets(top: 5.0,
                                              left: 0.0,
                                              bottom: -5.0,
                                              right: 0.0)
        navigationController?.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Map"
    }
    
}
