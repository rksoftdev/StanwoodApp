//
//  RepositoriesAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class RepositoriesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GitHubRepositoriesRepositoryProtocol.self) { resolver in
            let networkService = resolver.resolve(NetworkServiceable.self)!
            return GitHubRepositoriesRepository(networkService)
        }
    }
}
