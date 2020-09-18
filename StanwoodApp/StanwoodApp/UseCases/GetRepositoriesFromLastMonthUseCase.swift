//
//  GetRepositoriesFromLastMonthUseCase.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxSwift

protocol GetRepositoriesFromLastMonthUseCaseable {
    func execute(_ page: Int?) -> Single<([GitHubRepository], PaginationObject?)>
}

class GetRepositoriesFromLastMonthUseCase: GetRepositoriesFromLastMonthUseCaseable {
    private let repositoriesRepository: GitHubRepositoriesRepositoryProtocol
    
    init(_ repositoriesRepository: GitHubRepositoriesRepositoryProtocol) {
        self.repositoriesRepository = repositoriesRepository
    }
    
    func execute(_ page: Int?) -> Single<([GitHubRepository], PaginationObject?)> {
        self.repositoriesRepository.getFromLastMonth(page ?? 0)
    }
}
