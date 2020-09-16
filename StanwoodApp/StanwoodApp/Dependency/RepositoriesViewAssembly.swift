//
//  RepositoriesViewAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class RepositoriesViewAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RepositoriesViewModelable.self) { resolver in
            let getRepositoriesFromLastDayUseCase = resolver.resolve(GetRepositoriesFromLastDayUseCaseable.self)!
            let getRepositoriesFromLastWeekUseCase = resolver.resolve(GetRepositoriesFromLastWeekUseCaseable.self)!
            let getRepositoriesFromLastMonthUseCase = resolver.resolve(GetRepositoriesFromLastMonthUseCaseable.self)!
            return RepositoriesViewModel(getRepositoriesFromLastDayUseCase, getRepositoriesFromLastWeekUseCase, getRepositoriesFromLastMonthUseCase)
        }
        
        container.register(RepositoriesRoutable.self) { resolver in
            return RepositoriesRouter(resolver.resolve(Assembler.self)!)
        }
        
        container.register(RepositoriesViewController.self) { resolver in
            let viewModel = resolver.resolve(RepositoriesViewModelable.self)!
            let router = resolver.resolve(RepositoriesRoutable.self)!
            return RepositoriesViewController(viewModel, router)
        }
    }
}
