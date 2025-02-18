//
//  GitHubRepositoriesResponseMapper.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

extension GitHubRepositoriesResponse {
    func toGitHubRepositories() -> [GitHubRepository] {
        return self.repositories?.compactMap { $0.toGitHubRepository() } ?? []
    }
}

extension Optional where Wrapped == GitHubRepositoryResponse {
    func toGitHubRepository() -> GitHubRepository {
        guard let repo = self else {
            return GitHubRepository()
        }
        
        return GitHubRepository(repo.id ?? 0, repo.name ?? "", repo.description ?? "", repo.owner?.avatarUrl ?? "", false, repo.stars ?? 0, repo.forks ?? 0, repo.createdAt ?? "", repo.language ?? "", repo.gitHubUrl ?? "")
    }
}


