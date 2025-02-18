//
//  GitHubRepositoriesResponse.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

struct GitHubRepositoriesResponse: Codable {
    var repositories: [GitHubRepositoryResponse?]?
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}

struct GitHubRepositoryResponse: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var owner: GitHubRepositoryOwner?
    var url: String?
    var forks: Int?
    var stars: Int?
    var createdAt: String?
    var language: String?
    var gitHubUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id, owner, url, description, language
        case name = "full_name"
        case forks = "forks_count"
        case stars = "stargazers_count"
        case createdAt = "created_at"
        case gitHubUrl = "html_url"
    }
}

struct GitHubRepositoryOwner: Codable {
    var login: String?
    var avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
