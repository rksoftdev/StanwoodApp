//
//  DaosAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class DaosAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GitHubRepositoryDaoable.self) { resolver in
            return GitHubRepositoryDao()
        }
    }
}
