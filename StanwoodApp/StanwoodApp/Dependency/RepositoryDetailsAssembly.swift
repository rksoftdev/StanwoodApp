//
//  RepositoryDetailsAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class RepositoryDetailsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RepositoryDetailsViewModelable.self) { (resolver, model: GitHubRepository) in
            return RepositoryDetailsViewModel(model)
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
