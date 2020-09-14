//
//  BaseRouter.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class BaseRouter {
    var assembler: Assembler
    
    init(_ assembler: Assembler) {
        self.assembler = assembler
    }
}
