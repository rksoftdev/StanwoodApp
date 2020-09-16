//
//  GetRepositoriesFromLastDayUseCase.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxSwift

protocol GetRepositoriesFromLastDayUseCaseable {
    func execute() -> Single<[GitHubRepository]>
}

class GetRepositoriesFromLastDayUseCase: GetRepositoriesFromLastDayUseCaseable {
    private let repositoriesRepository: GitHubRepositoriesRepositoryProtocol
    
    init(_ repositoriesRepository: GitHubRepositoriesRepositoryProtocol) {
        self.repositoriesRepository = repositoriesRepository
    }
    
    func execute() -> Single<[GitHubRepository]> {
        .just([])
    }
}
