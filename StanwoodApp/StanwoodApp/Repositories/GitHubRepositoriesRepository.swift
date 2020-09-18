//
//  GitHubRepositoriesRepository.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxSwift

protocol GitHubRepositoriesRepositoryProtocol {
    func getFromLastDay(_ page: Int) -> Single<([GitHubRepository], PaginationObject?)>
    func getFromLastWeek(_ page: Int) -> Single<([GitHubRepository], PaginationObject?)>
    func getFromLastMonth(_ page: Int) -> Single<([GitHubRepository], PaginationObject?)>
    func saveToFavourites(_ repository: GitHubRepository)
    func deleteFromFavourites(_ repository: GitHubRepository)
    func getAllFavourite() -> Single<[GitHubRepository]>
    func checkIfIsFavourite(_ repository: GitHubRepository) -> Bool
}

class GitHubRepositoriesRepository: GitHubRepositoriesRepositoryProtocol {
    private let networkService: NetworkServiceable
    private let repositoryDao: GitHubRepositoryDaoable
    
    init(_ networkService: NetworkServiceable, _ dao: GitHubRepositoryDaoable) {
        self.networkService = networkService
        self.repositoryDao = dao
    }
    
    func getFromLastDay(_ page: Int) -> Single<([GitHubRepository], PaginationObject?)> {
        return self.getRepositoriesRequest(.createdLastDay, page).flatMap {
            self.handleResponse(response: $0)
        }
    }
    
    func getFromLastWeek(_ page: Int) -> Single<([GitHubRepository], PaginationObject?)> {
        return self.getRepositoriesRequest(.createdLastWeek, page).flatMap {
            self.handleResponse(response: $0)
        }
    }
    
    func getFromLastMonth(_ page: Int) -> Single<([GitHubRepository], PaginationObject?)> {
        return self.getRepositoriesRequest(.createdLastMonth, page).flatMap { self.handleResponse(response: $0)
        }
    }
    
    private func handleResponse(response: (response: GitHubRepositoriesResponse?, paginationObject: PaginationObject?)) -> Single<([GitHubRepository], PaginationObject?)> {
        if let result = response.response {
            return .just((result.toGitHubRepositories(), response.paginationObject))
        }
        return .just(([], nil))
    }
    
    private func getRepositoriesRequest(_ filterPeriod: FilterPeriod, _ page: Int) -> Single<(GitHubRepositoriesResponse?, PaginationObject?)> {
        let request = GetRepositoriesRequest(filterPeriod, page)
        return networkService.executeRequest(url: request.url, method: request.httpMethod, parameters: request.parameters, headers: request.headers)
    }
    
    func saveToFavourites(_ repository: GitHubRepository) {
        repositoryDao.save(repository.toEntity())
    }
    
    func deleteFromFavourites(_ repository: GitHubRepository) {
        repositoryDao.delete(repository.toEntity())
    }
    
    func getAllFavourite() -> Single<[GitHubRepository]> {
        return Single.create { observer in
            let favouriteRepositories = Array(self.repositoryDao.getAll()).compactMap { $0.toGitHubRepository() }
            observer(.success(favouriteRepositories))
            return Disposables.create()
        }
    }
    
    func checkIfIsFavourite(_ repository: GitHubRepository) -> Bool {
        return repositoryDao.checkIfIsFavourite(repository.id)
    }
}
