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
        let one = GitHubRepository("Repo First", "Repo First description", "https://avatars3.githubusercontent.com/u/241138?v=4", true)
        let two = GitHubRepository("Repo Second", "Repo Second description", "https://avatars3.githubusercontent.com/u/241138?v=4", false)
        let three = GitHubRepository("Repo Third", "Repo Third description", "https://avatars3.githubusercontent.com/u/241138?v=4", false)
        return [one, two, three, one]
    }
}
