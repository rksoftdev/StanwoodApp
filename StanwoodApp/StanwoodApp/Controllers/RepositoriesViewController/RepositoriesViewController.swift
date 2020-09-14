//
//  RepositoriesViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

class RepositoriesViewController: BaseViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var repositoriesTableView: UITableView!
    
    private let viewModel: RepositoriesViewModelable

    override func setControlsBehaviour() {
        titleLabel.text = "Repositories"
        prepareTableView()
    }
    
    init(_ viewModel: RepositoriesViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareTableView() {
        
    }
}
