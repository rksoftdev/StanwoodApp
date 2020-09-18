//
//  FavouritesViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FavouritesViewController: BaseViewController {
    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favouritesCollectionView: UICollectionView!
    
    //MARK: Properties
    private let viewModel: FavouritesViewModelable
    private let router: FavouritesRoutable
    private let disposeBag: DisposeBag = DisposeBag()
    
    private let collectionViewCellIdentifier = "RepositoryCollectionViewCell"
    
    //MARK: Initializers
    init(_ viewModel: FavouritesViewModelable, _ router: FavouritesRoutable) {
        self.viewModel = viewModel
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func createBindingSet() {
        disposeBag.insert(
            viewModel.repositoriesDataSource.bind(to: favouritesCollectionView.rx.items(cellIdentifier: collectionViewCellIdentifier)) { row, model, cell in
                guard let repositoryCell = cell as? RepositoryCollectionViewCell else {
                    return
                }
                
                repositoryCell.setup(model)
            },
            favouritesCollectionView.rx.modelSelected(GitHubRepository.self).subscribe { [weak self] model in
                guard let repositoryModel = model.element else {
                    return
                }
                self?.router.showDetailsViewController(from: self, with: repositoryModel)
            }
        )
    }
    
    override func setControlsBehaviour() {
        titleLabel.text = "Favourites"
        prepareCollectioView()
    }
    
    private func prepareCollectioView() {
        favouritesCollectionView.registerCell(collectionViewCellIdentifier)
        favouritesCollectionView.prepareItemSize(120, 80)
    }
}
