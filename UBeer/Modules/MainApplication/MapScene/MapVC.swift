//
//  MapVC.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit
import MapKit

final class MapVC: UIViewController {
    
    private weak var tableView: UITableView!
    private weak var mapView: MKMapView!
    
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
        view.backgroundColor = .white
        setupNavigationBar()
        setupViewsAndConstraints()
        viewModel.setupMapView(mapView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getCurrentPosition()
    }
    
    private func setupNavigationBar() {
       title = "Map"
    }
    
    private func setupViewsAndConstraints() {
        setupMapView()
        setupMapViewConstraints()
        
    }
    
    private func setupMapView() {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map)
        self.mapView = map
    }
    
    private func setupMapViewConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
