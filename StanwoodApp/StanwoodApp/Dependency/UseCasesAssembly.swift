//
//  UseCasesAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class UseCasesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetRepositoriesFromLastDayUseCaseable.self) { resolver in
            let repositoriesRepository = resolver.resolve(GitHubRepositoriesRepositoryProtocol.self)!
            return GetRepositoriesFromLastDayUseCase(repositoriesRepository)
        }
        
        container.register(GetRepositoriesFromLastWeekUseCaseable.self) { resolver in
            let repositoriesRepository = resolver.resolve(GitHubRepositoriesRepositoryProtocol.self)!
            return GetRepositoriesFromLastWeekUseCase(repositoriesRepository)
        }
        
        container.register(GetRepositoriesFromLastMonthUseCaseable.self) { resolver in
            let repositoriesRepository = resolver.resolve(GitHubRepositoriesRepositoryProtocol.self)!
            return GetRepositoriesFromLastMonthUseCase(repositoriesRepository)
        }
    }
}
