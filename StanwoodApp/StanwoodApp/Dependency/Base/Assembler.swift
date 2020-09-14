//
//  Assembler.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class Assembler {
    lazy var assembler: Swinject.Assembler = {
        return Swinject.Assembler([
            //AssemblerAssembly()
        ])
    }()

    func resolve<Service>(_ serviceType: Service.Type, name: String? = nil) -> Service? {
        return assembler.resolver.resolve(serviceType, name: name)
    }

    func resolve<Service, Argument>(_ serviceType: Service.Type, name: String? = nil, argument: Argument) -> Service? {
        return assembler.resolver.resolve(serviceType, name: name, argument: argument)
    }
}
