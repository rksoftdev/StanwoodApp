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
        let one = GitHubRepository(name: "Repo First", description: "Repo First description", avatarUrl: "https://avatars3.githubusercontent.com/u/241138?v=4")
        let two = GitHubRepository(name: "Repo Second", description: "Repo Second description", avatarUrl: "https://avatars3.githubusercontent.com/u/4329421?v=4", isFavourite: true)
        let three = GitHubRepository(name: "Repo Third", description: "Repo Third description", avatarUrl: "https://avatars3.githubusercontent.com/u/241138?v=4")
        return [one, two, three, one, two, three, one, two, three]
    }
}
