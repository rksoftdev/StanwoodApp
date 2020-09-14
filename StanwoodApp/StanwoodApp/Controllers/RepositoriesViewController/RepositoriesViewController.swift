//
//  RepositoriesViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

class RepositoriesViewController: BaseViewController {
    @IBOutlet weak var titleLabel: UILabel!

    override func setControlsBehaviour() {
        titleLabel.text = "Repositories"
    }
}
