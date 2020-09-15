//
//  RepositoriesViewModel.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxCocoa

protocol RepositoriesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> { get }
}

class RepositoriesViewModel: RepositoriesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> = .init(value: mockDataSource())
    
    private static func mockDataSource() -> [GitHubRepository] {
        let one = GitHubRepository(name: "Repo First", description: "Repo First description", avatarUrl: "https://avatars3.githubusercontent.com/u/241138?v=4", isFavourite: true)
        let two = GitHubRepository(name: "Repo Second", description: "Repo Second description")
        let three = GitHubRepository(name: "Repo Third", description: "Repo Third description")
        return [one, two, three, one]
    }
}
