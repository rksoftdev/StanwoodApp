//
//  AssemblerAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject

class AssemblerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Assembler.self) { _ in
            return Assembler()
        }.inObjectScope(.container)
    }
}
