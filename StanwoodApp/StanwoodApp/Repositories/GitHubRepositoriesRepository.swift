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
    func getFromLastDay() -> Single<[GitHubRepository]> {
        .just([])
    }
    
    func getFromLastWeek() -> Single<[GitHubRepository]> {
        .just([])
    }
    
    func getFromLastMonth() -> Single<[GitHubRepository]> {
        .just([])
    }
}
