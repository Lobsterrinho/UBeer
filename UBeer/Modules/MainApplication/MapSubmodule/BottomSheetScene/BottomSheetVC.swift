//
//  BottomSheetVC.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import UIKit

final class BottomSheetVC: UITableViewController {
    
    private var viewModel: BottomSheetVMProtocol
    
    init(viewModel: BottomSheetVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        viewModel.setupTableView(self.tableView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent {
            viewModel.shouldMoveToParent(true)
        }
    }
    
}
