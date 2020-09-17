//
//  GitHubRepositoryEntityMapper.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

extension GitHubRepositoryEntity {
    func toGitHubRepository() -> GitHubRepository {
        return GitHubRepository(self.id, self.name, self.desc, self.avatarUrl, true, self.starsCount, self.forksCount, self.createdAt, self.language, self.gitHubUrl)
    }
}
