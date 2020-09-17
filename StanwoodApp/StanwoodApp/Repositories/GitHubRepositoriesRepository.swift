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
    func saveToFavourites(_ repository: GitHubRepository)
    func deleteFromFavourites(_ repository: GitHubRepository)
}

class GitHubRepositoriesRepository: GitHubRepositoriesRepositoryProtocol {
    private let networkService: NetworkServiceable
    private let repositoryDao: GitHubRepositoryDaoable
    
    init(_ networkService: NetworkServiceable, _ dao: GitHubRepositoryDaoable) {
        self.networkService = networkService
        self.repositoryDao = dao
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
    
    func saveToFavourites(_ repository: GitHubRepository) {
        repositoryDao.save(repository.toEntity())
    }
    
    func deleteFromFavourites(_ repository: GitHubRepository) {
        repositoryDao.delete(repository.toEntity())
    }
}
