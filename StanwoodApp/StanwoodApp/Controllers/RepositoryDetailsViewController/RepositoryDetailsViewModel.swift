//
//  RepositoryDetailsViewModel.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxCocoa

protocol RepositoryDetailsViewModelable {
    var repositoryName: BehaviorRelay<String> { get }
    var repositoryDescription: BehaviorRelay<String> { get }
    var languageDescription: BehaviorRelay<String> { get }
    var starsCountDescription: BehaviorRelay<String> { get }
    var forksCountDescription: BehaviorRelay<String> { get }
    var createdDateDescription: BehaviorRelay<String> { get }
}

class RepositoryDetailsViewModel: RepositoryDetailsViewModelable {
    var repositoryName: BehaviorRelay<String> = .init(value: "")
    var languageDescription: BehaviorRelay<String> = .init(value: "")
    var repositoryDescription: BehaviorRelay<String> = .init(value: "")
    var starsCountDescription: BehaviorRelay<String> = .init(value: "")
    var forksCountDescription: BehaviorRelay<String> = .init(value: "")
    var createdDateDescription: BehaviorRelay<String> = .init(value: "")
    
    init(_ model: GitHubRepository) {
        handleModel(model)
    }
    
    private func handleModel(_ model: GitHubRepository) {
        repositoryName.accept(model.name )
        repositoryDescription.accept(model.description )
        languageDescription.accept("Swift")
        starsCountDescription.accept("5 Stars")
        forksCountDescription.accept("8 Forks")
        createdDateDescription.accept("Created 4 years ago at 12/05/2014")
    }
}
