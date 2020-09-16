//
//  BaseDetailsRouter.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

protocol BaseDetailsRoutable: BaseRoutable {
    func showDetailsViewController(from context: UIViewController?, with model: GitHubRepository)
}

class BaseDetailsRouter: BaseRouter, BaseDetailsRoutable {
    func showDetailsViewController(from context: UIViewController?, with model: GitHubRepository) {
        let detailsViewController = assembler.resolve(RepositoryDetailsViewController.self, argument: model)!
        context?.present(detailsViewController, animated: true)
    }
}
