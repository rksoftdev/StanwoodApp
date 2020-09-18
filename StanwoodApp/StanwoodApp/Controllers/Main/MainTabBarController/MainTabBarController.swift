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
        prepareTabBarController()
        super.viewDidLoad()
    }
    
    private func prepareTabBarController() {
        let repositoriesTabItem = UITabBarItem(title: "Repositories", image: UIImage(systemName: "tray"), selectedImage: UIImage(systemName: "tray.fill"))
        let repositoriesViewController = assembler.resolver.resolve(RepositoriesViewController.self)!
        repositoriesViewController.tabBarItem = repositoriesTabItem
        let favouritesTabItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
        let favouritesViewController = assembler.resolver.resolve(FavouritesViewController.self)!
        favouritesViewController.tabBarItem = favouritesTabItem
        viewControllers = [repositoriesViewController, favouritesViewController]
    }
}
