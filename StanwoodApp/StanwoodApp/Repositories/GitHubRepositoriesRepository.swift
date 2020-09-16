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
        return self.getRepositoriesRequest(.createdLastDay).flatMap {
            self.handleResponse(response: $0)
        }
    }
    
    func getFromLastWeek() -> Single<[GitHubRepository]> {
        return self.getRepositoriesRequest(.createdLastWeek).flatMap {
            self.handleResponse(response: $0)
        }
    }
    
    func getFromLastMonth() -> Single<[GitHubRepository]> {
        return self.getRepositoriesRequest(.createdLastMonth).flatMap { self.handleResponse(response: $0)
        }
    }
    
    private func handleResponse(response: GitHubRepositoriesResponse?) -> Single<[GitHubRepository]> {
        if let result = response {
            return .just(result.toGitHubRepositories())
        }
        return .just([])
    }
    
    private func getRepositoriesRequest(_ filterPeriod: FilterPeriod) -> Single<GitHubRepositoriesResponse?> {
        let request = GetRepositoriesRequest(filterPeriod)
        return networkService.executeRequest(url: request.url, method: request.httpMethod, parameters: request.parameters, headers: request.headers)
    }
}
