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
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> = .init(value: mockDataSource())
    
    private static func mockDataSource() -> [GitHubRepository] {
        let one = GitHubRepository("Repo First", "Repo First description", "https://avatars3.githubusercontent.com/u/241138?v=4", false)
        let two = GitHubRepository("Repo Second", "Repo Second description", "https://avatars3.githubusercontent.com/u/4329421?v=4", true)
        let three = GitHubRepository("Repo Third", "Repo Third description", "https://avatars3.githubusercontent.com/u/241138?v=4", false)
        return [one, two, three, one, two, three, one, two, three]
    }
}
