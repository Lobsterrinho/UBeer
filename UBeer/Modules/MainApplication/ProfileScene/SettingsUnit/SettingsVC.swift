//
//  SettingsVC.swift
//  UBeer
//
//  Created by Lobster on 1.04.23.
//

import UIKit

final class SettingsVC: UIViewController {
    
    private weak var tableView: UITableView!
 
    private var viewModel: SettingsVMProtocol
    
    init(viewModel: SettingsVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        setupViewsAndConstraints()
        viewModel.setupAdapter(with: tableView)
        viewModel.setupSections()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            viewModel.shouldMoveToParent(false)
        }
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
