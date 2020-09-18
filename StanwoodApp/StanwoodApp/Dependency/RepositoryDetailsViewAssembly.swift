//
//  RepositoryDetailsViewAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class RepositoryDetailsViewAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RepositoryDetailsViewModelable.self) { (resolver, model: GitHubRepository) in
            let saveRepositoryUseCase = resolver.resolve(SaveGitHubRepositoryToFavouritesUseCaseable.self)!
            let deleteRepositoryUseCase = resolver.resolve(DeleteGitHubRepositoryFromFavouritesUseCaseable.self)!
            return RepositoryDetailsViewModel(model, saveRepositoryUseCase, deleteRepositoryUseCase)
        }
        
        container.register(RepositoryDetailsRoutable.self) { resolver in
            return RepositoryDetailsRouter(resolver.resolve(Assembler.self)!)
        }
        
        container.register(RepositoryDetailsViewController.self) { (resolver, model: GitHubRepository)  in
            let viewModel = resolver.resolve(RepositoryDetailsViewModelable.self, argument: model)!
            let router = resolver.resolve(RepositoryDetailsRoutable.self)!
            return RepositoryDetailsViewController(viewModel, router)
        }
    }
}
