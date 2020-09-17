//
//  GitHubRepositoryMapper.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

extension GitHubRepository {
    func toEntity() -> GitHubRepositoryEntity {
        return GitHubRepositoryEntity(id: self.id, name: self.name, desc: self.description, avatarUrl: self.avatarUrl, starsCount: self.starsCount, forksCount: self.forksCount, createdAt: self.createdAt, language: self.language, gitHubUrl: self.gitHubUrl)
    }
}


