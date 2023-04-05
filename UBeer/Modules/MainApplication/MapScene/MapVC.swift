//
//  MapVC.swift
//  UBeer
//
//  Created by Lobster on 31.03.23.
//

import UIKit

final class MapVC: UIViewController {
    
    private weak var tableView: UITableView!
    
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
        setupNavigationBar()
        view.backgroundColor = .white
        setupViewsAndConstraints()
        viewModel.setupAdapter(with: tableView)
    }
    
    private func setupNavigationBar() {
       title = "Map"
    }
    
    private func setupViewsAndConstraints() {
        setupTableView()
        setupTableViewConstraints()
        
    }
    
    private func setupTableView() {
        let table = UITableView(frame: .zero,
                                style: .insetGrouped)
        table.backgroundColor = .mainWhite
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        self.tableView = table
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
