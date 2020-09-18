//
//  BaseRouter.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject
import UIKit

protocol BaseRoutable{
    func showErrorDialog(from context: UIViewController?, with message: String?)
}

class BaseRouter: BaseRoutable {
    func showErrorDialog(from context: UIViewController?, with message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert )
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        context?.show(alert, sender: nil)
    }
    
    var assembler: Assembler
    
    init(_ assembler: Assembler) {
        self.assembler = assembler
    }
}
