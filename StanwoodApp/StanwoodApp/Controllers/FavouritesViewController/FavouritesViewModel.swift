//
//  FavouritesViewModel.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxCocoa

protocol FavouritesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> { get }
}

class FavouritesViewModel: FavouritesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> = .init(value: [])
}
