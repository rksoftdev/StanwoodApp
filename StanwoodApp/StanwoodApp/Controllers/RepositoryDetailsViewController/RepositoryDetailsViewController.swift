//
//  RepositoryDetailsViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import PanModal

class RepositoryDetailsViewController: BaseViewController, PanModalPresentable {
    //MARK: Outlets
    
    //MARK: Properties
    private let viewModel: RepositoryDetailsViewModelable
    
    //MARK: Initializers
    init(_ viewModel: RepositoryDetailsViewModelable) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var panScrollable: UIScrollView? {
        return nil
    }
}
