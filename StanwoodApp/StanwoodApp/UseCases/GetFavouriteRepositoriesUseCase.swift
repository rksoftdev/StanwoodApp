//
//  GetFavouriteRepositoriesUseCase.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxSwift

protocol GetFavouriteRepositoriesUseCaseable {
    func execute() -> Single<[GitHubRepository]>
}

class GetFavouriteRepositoriesUseCase: GetFavouriteRepositoriesUseCaseable {
    private let repositoriesRepository: GitHubRepositoriesRepositoryProtocol
    
    init(_ repositoriesRepository: GitHubRepositoriesRepositoryProtocol) {
        self.repositoriesRepository = repositoriesRepository
    }
    
    func execute() -> Single<[GitHubRepository]> {
        return repositoriesRepository.getAllFavourite()
    }
}
