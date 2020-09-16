//
//  GitHubRepositoriesRepository.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxSwift

protocol GitHubRepositoriesRepositoryProtocol {
    func getFromLastDay() -> Single<[GitHubRepository]>
    func getFromLastWeek() -> Single<[GitHubRepository]>
    func getFromLastMonth() -> Single<[GitHubRepository]>
}

class GitHubRepositoriesRepository: GitHubRepositoriesRepositoryProtocol {
    private let networkService: NetworkServiceable
    
    init(_ networkService: NetworkServiceable) {
        self.networkService = networkService
    }
    
    func getFromLastDay() -> Single<[GitHubRepository]> {
        return self.getFromLastDayRequest().flatMap { response in
            if let result = response {
                return .just(result.toGitHubRepositories())
            }
            return .just([])
        }
    }
    
    private func getFromLastDayRequest() -> Single<GitHubRepositoriesResponse?> {
        let request = GetRepositoriesRequest(.createdLastDay)
        return networkService.executeRequest(url: request.url, method: request.httpMethod, parameters: request.parameters, headers: request.headers)
    }
    
    func getFromLastWeek() -> Single<[GitHubRepository]> {
        .just([])
    }
    
    func getFromLastMonth() -> Single<[GitHubRepository]> {
        .just([])
    }
}
