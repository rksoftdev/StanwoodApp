//
//  BaseViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    func createBindingSet() {}
    func setControlsBehaviour() {}
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        createBindingSet()
        setControlsBehaviour()
    }
}
