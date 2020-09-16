//
//  GetRepositoriesFromLastMonthUseCase.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxSwift

protocol GetRepositoriesFromLastMonthUseCaseable {
    func execute() -> Single<[GitHubRepository]>
}

class GetRepositoriesFromLastMonthUseCase: GetRepositoriesFromLastMonthUseCaseable {
    private let repositoriesRepository: GitHubRepositoriesRepositoryProtocol
    
    init(_ repositoriesRepository: GitHubRepositoriesRepositoryProtocol) {
        self.repositoriesRepository = repositoriesRepository
    }
    
    func execute() -> Single<[GitHubRepository]> {
        self.repositoriesRepository.getFromLastMonth()
    }
}
