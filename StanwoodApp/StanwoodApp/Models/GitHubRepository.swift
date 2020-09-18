//
//  GitHubRepository.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Foundation

struct GitHubRepository {
    var id: Int
    var name: String
    var description: String
    var avatarUrl: String
    var starsCount: Int
    var forksCount: Int
    var createdAt: String
    var language: String
    var isFavourite: Bool
    var gitHubUrl: String
    
    init() {
        self.id = 0
        self.name = ""
        self.description = ""
        self.avatarUrl = ""
        self.isFavourite = false
        self.forksCount = 0
        self.starsCount = 0
        self.createdAt = ""
        self.language = ""
        self.gitHubUrl = ""
    }
    
    init(_ id: Int, _ name: String, _ description: String, _ avatarUrl: String, _ isFavourite: Bool, _ starsCount: Int, _ forksCount: Int, _ createdAt: String, _ language: String, _ gitHubUrl: String) {
        self.id = id
        self.name = name
        self.description = description
        self.avatarUrl = avatarUrl
        self.isFavourite = isFavourite
        self.starsCount = starsCount
        self.forksCount = forksCount
        self.createdAt = createdAt
        self.language = language
        self.gitHubUrl = gitHubUrl
    }
}
