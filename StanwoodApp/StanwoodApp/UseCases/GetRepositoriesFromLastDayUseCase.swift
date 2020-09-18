//
//  GetRepositoriesFromLastDayUseCase.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxSwift

protocol GetRepositoriesFromLastDayUseCaseable {
    func execute(_ page: Int?) -> Single<([GitHubRepository], PaginationObject?)>
}

class GetRepositoriesFromLastDayUseCase: GetRepositoriesFromLastDayUseCaseable {
    private let repositoriesRepository: GitHubRepositoriesRepositoryProtocol
    
    init(_ repositoriesRepository: GitHubRepositoriesRepositoryProtocol) {
        self.repositoriesRepository = repositoriesRepository
    }
    
    func execute(_ page: Int?) -> Single<([GitHubRepository], PaginationObject?)> {
        self.repositoriesRepository.getFromLastDay(page ?? 0)
    }
}
