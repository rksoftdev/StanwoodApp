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
    @IBOutlet weak var repositoriesCollectionView: UICollectionView!
    @IBOutlet weak var repositoriesFilterSegmentedControl: UISegmentedControl!
    
    private let viewModel: RepositoriesViewModelable
    private let router: RepositoriesRoutable
    private let disposeBag: DisposeBag = DisposeBag()
    
    private let collectionViewCellIdentifier = "RepositoryCollectionViewCell"

    override func setControlsBehaviour() {
        titleLabel.text = "Repositories"
        prepareCollectionView()
    }
    
    override func createBindingSet() {
        disposeBag.insert(
            viewModel.repositoriesDataSource.bind(to: self.repositoriesCollectionView.rx.items(cellIdentifier: collectionViewCellIdentifier)) { row, model, cell in
                guard let repositoryCell = cell as? RepositoryCollectionViewCell else {
                    return 
                }
                
                repositoryCell.setup(model)
            },
            repositoriesCollectionView.rx.modelSelected(GitHubRepository.self).subscribe { [weak self] model in
                guard let repositoryModel = model.element else {
                    return
                }
                self?.router.showDetailsViewController(from: self, with: repositoryModel)
            },
            repositoriesFilterSegmentedControl.rx.selectedSegmentIndex.bind { [weak self] index in
                self?.viewModel.reloadData(with: FilterPeriod(rawValue: index) ?? .createdLastDay)
            },
            viewModel.errorHandler.bind { [weak self] error in
                self?.router.showErrorDialog(from: self, with: error.localizedDescription)
            }
        )
    }
    
    init(_ viewModel: RepositoriesViewModelable, _ router: RepositoriesRoutable) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        
        viewModel.reloadData(with: .createdLastDay)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareCollectionView() {
        repositoriesCollectionView.registerCell(collectionViewCellIdentifier)
        repositoriesCollectionView.prepareItemSize(120, 80)
    }
}
