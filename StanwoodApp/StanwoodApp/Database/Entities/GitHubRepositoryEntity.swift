//
//  GitHubRepositoryEntity.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RealmSwift
import Realm

class GitHubRepositoryEntity: Object {
    @objc dynamic public var id: Int = 0
    @objc dynamic public var name: String = ""
    @objc dynamic public var desc: String = ""
    @objc dynamic public var avatarUrl: String = ""
    @objc dynamic public var starsCount: Int = 0
    @objc dynamic public var forksCount: Int = 0
    @objc dynamic public var createdAt: String = ""
    @objc dynamic public var language: String = ""
    @objc dynamic public var gitHubUrl: String = ""
    
    init(id: Int, name: String, desc: String, avatarUrl: String, starsCount: Int, forksCount: Int, createdAt: String, language: String, gitHubUrl: String) {
        self.id = id
        self.name = name
        self.desc = desc
        self.avatarUrl = avatarUrl
        self.starsCount = starsCount
        self.forksCount = forksCount
        self.createdAt = createdAt
        self.language = language
        self.gitHubUrl = gitHubUrl
        
        super.init()
    }
    
    required init() {
        super.init()
    }
}
