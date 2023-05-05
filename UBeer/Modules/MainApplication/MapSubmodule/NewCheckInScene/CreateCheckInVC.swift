//
//  CreateCheckInVC.swift
//  UBeer
//
//  Created by Lobster on 23.04.23.
//

import Foundation
import UIKit

final class CreateCheckInVC: UIViewController {
    
    private weak var tableView: UITableView!
    private weak var backgroundView: UIView!
    
    private var viewModel: CreateCheckInVMProtocol
    
    init(viewModel: CreateCheckInVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsAndConstraints()
        setupTapGesture()
        viewModel.setupTableView(tableView)
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(didTapOnView))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapOnView() {
        viewModel.presentDiscardAlert()
    }
    
    private func setupViewsAndConstraints() {
        view.backgroundColor = .clear
        
        setupTableView()
        setupTableViewConstraints()
        
        setupBackgroundView()
        setupBackgroundViewConstraints()
        
        view.bringSubviewToFront(tableView)
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero,
                                    style: .insetGrouped)
        tableView.layer.cornerRadius = 10.0
        tableView.backgroundColor = .mainWhite
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        self.tableView = tableView
    }
    
    private func setupBackgroundView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        self.backgroundView = backgroundView
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 100.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 40.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -40.0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                              constant: -100.0)
        ])
    }
    
    private func setupBackgroundViewConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
