//
//  RepositoriesViewModel.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxCocoa

protocol RepositoriesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[String]> { get }
}

class RepositoriesViewModel: RepositoriesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[String]> = .init(value: ["A","B","C"])
}
