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
        container.register(RepositoryDetailsViewModelable.self) { resolver in
            return RepositoryDetailsViewModel()
        }
        
        container.register(RepositoryDetailsViewController.self) { resolver in
            let viewModel = resolver.resolve(RepositoryDetailsViewModelable.self)!
            return RepositoryDetailsViewController(viewModel)
        }
    }
}
