//
//  MapVC.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit
import MapKit

final class MapVC: UIViewController {
    
    private weak var mapView: MKMapView!
    
    //Button to open form with fields where user can indicate some info about his current rest and pin the place for whole users in real time
    private weak var beerButton: UIButton!
    
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
        viewModel.loadUsers()
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
                             action: #selector(addUser),
                             for: .touchUpInside)
    }
    
    @objc private func addUser() {
        viewModel.addUser()
    }
    
    private func setupViewsAndConstraints() {
        setupMapView()
        setupMapViewConstraints()
        
        setupBeerButton()
        setupBeerButtonConstraints()
    }
    
    private func setupMapView() {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map)
        self.mapView = map
    }
    
    private func setupBeerButton() {
        let button = UIButton()
        button.backgroundColor = .white.withAlphaComponent(0.7)
        let image = UIImage(named: "beerMapIcon")
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: image!.size.width * 1.2, height: image!.size.height * 1.2))
        let scaledImage = renderer.image { _ in
            image?.draw(in: CGRect(origin: .zero, size: CGSize(width: image!.size.width * 1.2, height: image!.size.height * 1.2)))
        }
        button.setImage(scaledImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        self.beerButton = button
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
            beerButton.widthAnchor.constraint(equalToConstant: 60.0),
            beerButton.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
}
