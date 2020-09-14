//
//  FavouritesViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

class FavouritesViewController: BaseViewController {
    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: Properties
    private let viewModel: FavouritesViewModelable
    
    //MARK: Initializers
    init(_ viewModel: FavouritesViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setControlsBehaviour() {
        titleLabel.text = "Favourites"
    }
}

