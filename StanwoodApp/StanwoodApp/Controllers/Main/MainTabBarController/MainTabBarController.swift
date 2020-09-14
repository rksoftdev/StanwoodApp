//
//  MainTabBarController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    private let assembler = Assembler().assembler
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func prepareTabBarController() {
        let repositoriesViewController = assembler.resolver.resolve(RepositoriesViewController.self)!
        let favouritesViewController = assembler.resolver.resolve(FavouritesViewController.self)!
        viewControllers = [repositoriesViewController, favouritesViewController]
    }
}
