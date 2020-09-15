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
    
    private let viewModel: RepositoriesViewModelable
    private let disposeBag: DisposeBag = DisposeBag()

    override func setControlsBehaviour() {
        titleLabel.text = "Repositories"
        prepareCollectionView()
    }
    
    override func createBindingSet() {
        disposeBag.insert(
            viewModel.repositoriesDataSource.bind(to: self.repositoriesCollectionView.rx.items(cellIdentifier: "RepositoryCollectionViewCell")) { [weak self] row, model, cell in
                guard let repositoryCell = cell as? RepositoryCollectionViewCell else {
                    return 
                }
                
                repositoryCell.setup(model)
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
    
    private func prepareCollectionView() {
        let cellView = UINib(nibName: "RepositoryCollectionViewCell", bundle: nil)
        repositoriesCollectionView.register(cellView, forCellWithReuseIdentifier: "RepositoryCollectionViewCell")
        repositoriesCollectionView.prepareItemSize(120, 80)
    }
}
