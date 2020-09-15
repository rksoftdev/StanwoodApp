//
//  RepositoryDetailsViewModel.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

protocol RepositoryDetailsViewModelable {
    
}

class RepositoryDetailsViewModel: RepositoryDetailsViewModelable {
    init(_ model: GitHubRepository) {
        handleModel(model)
    }
    
    private func handleModel(_ model: GitHubRepository) {
        
    }
}
