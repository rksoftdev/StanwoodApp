//
//  RepositoryDetailsViewModel.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxCocoa
import RxSwift

protocol RepositoryDetailsViewModelable {
    var repositoryName: BehaviorRelay<String> { get }
    var repositoryDescription: BehaviorRelay<String> { get }
    var languageDescription: BehaviorRelay<String> { get }
    var starsCountDescription: BehaviorRelay<String> { get }
    var forksCountDescription: BehaviorRelay<String> { get }
    var createdDateDescription: BehaviorRelay<String> { get }
    var isFafourite: BehaviorRelay<Bool> { get }
    func openGitHubUrl()
    var errorHandler: PublishSubject<String> { get }
    func isFavouriteChanged()
}

class RepositoryDetailsViewModel: RepositoryDetailsViewModelable {
    var repositoryName: BehaviorRelay<String> = .init(value: "")
    var languageDescription: BehaviorRelay<String> = .init(value: "")
    var repositoryDescription: BehaviorRelay<String> = .init(value: "")
    var starsCountDescription: BehaviorRelay<String> = .init(value: "")
    var forksCountDescription: BehaviorRelay<String> = .init(value: "")
    var createdDateDescription: BehaviorRelay<String> = .init(value: "")
    var isFafourite: BehaviorRelay<Bool> = .init(value: false)
    var errorHandler: PublishSubject<String> = .init()
    private var gitHubUrl: String?
    
    private let repositoryModel: GitHubRepository
    private let saveRepositoryUseCase: SaveGitHubRepositoryToFavouritesUseCaseable
    private let deleteRepositoryUseCase: DeleteGitHubRepositoryFromFavouritesUseCaseable
    
    init(_ model: GitHubRepository, _ saveRepositoryToFavouriteUseCase: SaveGitHubRepositoryToFavouritesUseCaseable, _ deleteRepositoryFromFavouritesUseCase: DeleteGitHubRepositoryFromFavouritesUseCaseable) {
        repositoryModel = model
        saveRepositoryUseCase = saveRepositoryToFavouriteUseCase
        deleteRepositoryUseCase = deleteRepositoryFromFavouritesUseCase
        handleModel()
    }
    
    private func handleModel() {
        gitHubUrl = repositoryModel.gitHubUrl
        repositoryName.accept(repositoryModel.name )
        repositoryDescription.accept(repositoryModel.description )
        languageDescription.accept(repositoryModel.language)
        starsCountDescription.accept("\(repositoryModel.starsCount) Stars")
        forksCountDescription.accept("\(repositoryModel.forksCount) Forks")
        createdDateDescription.accept("Created at \(DateHelper().getDateStringFrom(repositoryModel.createdAt, .yyyyMMddTHHmmssZ))")
        isFafourite.accept(repositoryModel.isFavourite)
    }
    
    func isFavouriteChanged() {
        isFafourite.accept(!isFafourite.value)
        isFafourite.value
            ? saveToFavourites()
            : deleteFromFavourites()
    }
    
    private func saveToFavourites() {
        saveRepositoryUseCase.execute(repositoryModel)
    }
    
    private func deleteFromFavourites() {
        deleteRepositoryUseCase.execute(repositoryModel)
    }
    
    func openGitHubUrl() {
        guard let url = URL(string: self.gitHubUrl ?? "") else {
            errorHandler.onNext("Cannot open in GitHub")
            return
        }
        UIApplication.shared.open(url)
    }
}
