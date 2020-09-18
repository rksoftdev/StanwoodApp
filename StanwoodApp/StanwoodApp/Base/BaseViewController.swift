//
//  BaseViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import PanModal

class BaseViewController: UIViewController {
    func createBindingSet() {}
    func setControlsBehaviour() {}
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        createBindingSet()
        setControlsBehaviour()
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if let presentableController = viewControllerToPresent as? PanModalPresentable, let controller = presentableController as? UIViewController {
            controller.modalPresentationStyle = .custom
            controller.modalPresentationCapturesStatusBarAppearance = true
            controller.transitioningDelegate = PanModalPresentationDelegate.default
            super.present(controller, animated: flag, completion: completion)
            return
        }
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
