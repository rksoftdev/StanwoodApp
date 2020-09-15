//
//  RepositoriesRouter.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import PanModal

protocol RepositoriesRoutable {
    func showDetailsViewController(from context: UIViewController?, with model: GitHubRepository)
}

class RepositoriesRouter: BaseRouter, RepositoriesRoutable {
    func showDetailsViewController(from context: UIViewController?, with model: GitHubRepository) {
        let detailsViewController = assembler.resolve(RepositoryDetailsViewController.self)!
        context?.presentPanModal(detailsViewController)
    }
}
