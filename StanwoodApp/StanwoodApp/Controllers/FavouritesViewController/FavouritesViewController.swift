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
    private let disposeBag: DisposeBag = DisposeBag()
    
    //MARK: Initializers
    init(_ viewModel: FavouritesViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func createBindingSet() {
        disposeBag.insert(
            viewModel.repositoriesDataSource.bind(to: favouritesCollectionView.rx.items(cellIdentifier: "RepositoryCollectionViewCell")) { [weak self] row, model, cell in
                guard let repositoryCell = cell as? RepositoryCollectionViewCell else {
                    return
                }
                
                repositoryCell.setup(model)
        })
    }
    
    override func setControlsBehaviour() {
        titleLabel.text = "Favourites"
        prepareCollectioView()
    }
    
    private func prepareCollectioView() {
        let cellView = UINib(nibName: "RepositoryCollectionViewCell", bundle: nil)
        favouritesCollectionView.register(cellView, forCellWithReuseIdentifier: "RepositoryCollectionViewCell")
        guard let layout = favouritesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        let itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIDevice.current.userInterfaceIdiom == .pad ? 120 : 80)
        layout.itemSize = itemSize
    }
}
