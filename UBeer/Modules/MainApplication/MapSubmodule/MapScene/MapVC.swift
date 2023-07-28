//
//  MapVC.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit
import MapKit

final class MapVC: UIViewController {
    
    private enum Consts {
        static let createCheckIcon: String = "location.fill"
    }
    
    private weak var mapView: MKMapView!
    private weak var beerButton: UIButton!
    private weak var createCheckInButton: UIButton!
    
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
        setupSelectors()
        viewModel.loadCheckIns()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        beerButton.layer.cornerRadius = beerButton.frame.size.width / 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getCurrentPosition()
    }
    
    private func setupNavigationBar() {
       title = "Map"
    }
    
    private func setupSelectors() {
        beerButton.addTarget(self,
                             action: #selector(centerMapOnUser),
                             for: .touchUpInside)
        
        createCheckInButton.addTarget(self,
                                      action: #selector(createNewCheckInt),
                                      for: .touchUpInside)
    }
    
    @objc private func createNewCheckInt() {
        viewModel.openAddNewCheckInScene()
    }
    
    @objc private func centerMapOnUser() {
        viewModel.centerMapOnUser()
    }
    
    private func setupViewsAndConstraints() {
        setupMapView()
        setupMapViewConstraints()
        
        setupBeerButton()
        setupBeerButtonConstraints()
        
        setupCreateCheckInButton()
        setupCreateCheckInButtonConstraints()
    }
    
    private func setupMapView() {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map)
        self.mapView = map
    }
    
    private func setupBeerButton() {
        let button = UIButton(type: .system)
        button.backgroundColor = .white.withAlphaComponent(0.7)
        let image = UIImage.makeScaledImage(imageName: Consts.createCheckIcon,
                                            scale: 1.2)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        self.beerButton = button
    }
    
    private func setupCreateCheckInButton() {
        let button = RegularButton("Create check in")
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        self.createCheckInButton = button
    }
    
    private func setupMapViewConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBeerButtonConstraints() {
        NSLayoutConstraint.activate([
            beerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -20.0),
            beerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -30.0),
            beerButton.widthAnchor.constraint(equalToConstant: 50.0),
            beerButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    private func setupCreateCheckInButtonConstraints() {
        NSLayoutConstraint.activate([
            createCheckInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 20.0),
            createCheckInButton.trailingAnchor.constraint(equalTo: beerButton.leadingAnchor,
                                                 constant: -20),
            createCheckInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -30.0),
            createCheckInButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
}
