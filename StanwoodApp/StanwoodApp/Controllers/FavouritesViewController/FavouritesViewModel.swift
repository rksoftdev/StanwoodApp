//
//  FavouritesViewModel.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxCocoa
import RxSwift

protocol FavouritesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> { get }
    var errorHandler: PublishSubject<Error> { get }
    func reloadData()
}

class FavouritesViewModel: FavouritesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> = .init(value: [])
    var errorHandler: PublishSubject<Error> = .init()
    
    private let disposeBag: DisposeBag
    private let getAllRepositoriesUseCase: GetFavouriteRepositoriesUseCaseable
    
    init(_ getAllFavouriteRepositoriesUseCase: GetFavouriteRepositoriesUseCaseable) {
        disposeBag = DisposeBag()
        getAllRepositoriesUseCase = getAllFavouriteRepositoriesUseCase
    }
    
    func reloadData() {
        getAllRepositoriesUseCase.execute().subscribe(onSuccess: { [weak self] result in
            self?.repositoriesDataSource.accept(result)
        }, onError: { error in
            self.errorHandler.onNext(error)
        }).disposed(by: disposeBag)
    }
}
