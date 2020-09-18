//
//  ServicesAssembly.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Swinject
import RealmSwift

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkServiceable.self) { resolver in
            return NetworkService()
        }
    }
}
