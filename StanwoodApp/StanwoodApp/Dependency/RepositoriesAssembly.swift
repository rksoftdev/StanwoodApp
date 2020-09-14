//
//  RepositoriesAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class RepositoriesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RepositoriesViewModelable.self) { resolver in
            return RepositoriesViewModel()
        }
        
        container.register(RepositoriesViewController.self) { resolver in
            let viewModel = resolver.resolve(RepositoriesViewModelable.self)!
            return RepositoriesViewController(viewModel)
        }
    }
}
