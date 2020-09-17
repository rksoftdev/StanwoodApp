//
//  DeleteGitHubRepositoryFromFavouritesUseCase.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxSwift

protocol DeleteGitHubRepositoryFromFavouritesUseCaseable {
    func execute(_ repository: GitHubRepository)
}

class DeleteGitHubRepositoryFromFavouritesUseCase: DeleteGitHubRepositoryFromFavouritesUseCaseable {
    private let repositoriesRepository: GitHubRepositoriesRepositoryProtocol
    
    init(_ repositoriesRepository: GitHubRepositoriesRepositoryProtocol) {
        self.repositoriesRepository = repositoriesRepository
    }
    
    func execute(_ repository: GitHubRepository) {
        repositoriesRepository.deleteFromFavourites(repository)
    }
}
