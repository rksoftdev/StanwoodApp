//
//  FavouritesViewAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class FavouritesViewAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FavouritesViewModelable.self) { resolver in
            let getFavouritesUseCase = resolver.resolve(GetFavouriteRepositoriesUseCaseable.self)!
            return FavouritesViewModel(getFavouritesUseCase)
        }
        
        container.register(FavouritesRoutable.self) { resolver in
            return FavouritesRouter(resolver.resolve(Assembler.self)!)
        }
        
        container.register(FavouritesViewController.self) { resolver in
            let viewModel = resolver.resolve(FavouritesViewModelable.self)!
            let router = resolver.resolve(FavouritesRoutable.self)!
            return FavouritesViewController(viewModel, router)
        }
    }
}
