//
//  RepositoriesViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoriesViewController: BaseViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var repositoriesTableView: UITableView!
    
    private let viewModel: RepositoriesViewModelable
    private let disposeBag: DisposeBag = DisposeBag()

    override func setControlsBehaviour() {
        titleLabel.text = "Repositories"
        prepareTableView()
    }
    
    override func createBindingSet() {
        disposeBag.insert(
            viewModel.repositoriesDataSource.bind(to: self.repositoriesTableView.rx.items(cellIdentifier: "RepositoryTableViewCell")) { [weak self] row, model, cell in
                guard let repositoryCell = cell as? RepositoryTableViewCell else {
                    return 
                }
            }
        )
    }
    
    init(_ viewModel: RepositoriesViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareTableView() {
        let cellView = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        repositoriesTableView.register(cellView, forCellReuseIdentifier: "RepositoryTableViewCell")
        switch UIScreen.main.traitCollection.userInterfaceIdiom {
        case .pad:
            repositoriesTableView.rowHeight = 120
        default:
            repositoriesTableView.rowHeight = 80
        }
    }
}
