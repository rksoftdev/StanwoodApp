//
//  GitHubRepository.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Foundation

struct GitHubRepository {
    var name: String
    var description: String
    var avatarUrl: String
    var starsCount: Int
    var forksCount: Int
    var createdAt: String
    var language: String
    var isFavourite: Bool
    
    init() {
        self.name = ""
        self.description = ""
        self.avatarUrl = ""
        self.isFavourite = false
        self.forksCount = 0
        self.starsCount = 0
        self.createdAt = ""
        self.language = ""
    }
    
    init(_ name: String, _ description: String, _ avatarUrl: String, _ isFavourite: Bool, _ starsCount: Int, _ forksCount: Int, _ createdAt: String, _ language: String) {
        self.name = name
        self.description = description
        self.avatarUrl = avatarUrl
        self.isFavourite = isFavourite
        self.starsCount = starsCount
        self.forksCount = forksCount
        self.createdAt = createdAt
        self.language = language
    }
}
