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
    var isFavourite: Bool
    
    init() {
        self.name = ""
        self.description = ""
        self.avatarUrl = ""
        self.isFavourite = false
    }
    
    init(_ name: String, _ description: String, _ avatarUrl: String, _ isFavourite: Bool) {
        self.name = name
        self.description = description
        self.avatarUrl = avatarUrl
        self.isFavourite = isFavourite
    }
}
