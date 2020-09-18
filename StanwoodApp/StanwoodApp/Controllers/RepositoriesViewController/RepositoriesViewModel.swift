//
//  RepositoriesViewModel.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RxCocoa
import RxSwift

protocol RepositoriesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> { get }
    func reloadData(with filterPeriod: FilterPeriod)
    func loadNextPage(for filterPeriod: FilterPeriod)
    var errorHandler: PublishSubject<Error> { get }
}

class RepositoriesViewModel: RepositoriesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> = .init(value: [])
    var errorHandler: PublishSubject<Error> = .init()
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    
    private let disposeBag: DisposeBag
    private var paginationObject: PaginationObject?
    
    private let getRepositoriesFromLastDayUseCase: GetRepositoriesFromLastDayUseCaseable
    private let getRepositoriesFromLastWeekUseCase: GetRepositoriesFromLastWeekUseCaseable
    private let getRepositoriesFromLastMonthUseCase: GetRepositoriesFromLastMonthUseCaseable
    private let checkIfIsFavouriteUseCase: CheckIfIsFavouriteRepositoryUseCaseable
    
    init(_ getRepositoriesFromLastDayUseCase: GetRepositoriesFromLastDayUseCaseable, _ getRepositoriesFromLastWeekUseCase: GetRepositoriesFromLastWeekUseCaseable, _ getRepositoriesFromLastMonthUseCase: GetRepositoriesFromLastMonthUseCaseable,
         _ checkIfIsFavouriteRepositoryUseCase: CheckIfIsFavouriteRepositoryUseCaseable) {
        self.getRepositoriesFromLastDayUseCase = getRepositoriesFromLastDayUseCase
        self.getRepositoriesFromLastWeekUseCase = getRepositoriesFromLastWeekUseCase
        self.getRepositoriesFromLastMonthUseCase = getRepositoriesFromLastMonthUseCase
        self.checkIfIsFavouriteUseCase = checkIfIsFavouriteRepositoryUseCase
        self.disposeBag = DisposeBag()
    }
    
    func loadNextPage(for filterPeriod: FilterPeriod) {
        guard paginationObject?.canLoadNextPage ?? false else {
            return
        }
        loadData(for: filterPeriod, false)
    }
    
    func reloadData(with filterPeriod: FilterPeriod) {
        repositoriesDataSource.accept([])
        paginationObject = nil
        loadData(for: filterPeriod, true)
    }
    
    private func loadData(for filterPeriod: FilterPeriod, _ shouldReload: Bool) {
        switch filterPeriod {
        case .createdLastDay:
            getRepositoriesFromLastDay(shouldReload)
        case .createdLastWeek:
            getRepositoriesFromLastWeek(shouldReload)
        case .createdLastMonth:
            getRepositoriesFromLastMonth(shouldReload)
        }
    }
    
    private func getRepositoriesFromLastDay(_ shouldReload: Bool) {
        self.handleResponse(shouldReload, self.getRepositoriesFromLastDayUseCase.execute(paginationObject?.nextPage))
            .disposed(by: self.disposeBag)
    }
    
    private func getRepositoriesFromLastWeek(_ shouldReload: Bool) {
        self.handleResponse(shouldReload, self.getRepositoriesFromLastWeekUseCase.execute(paginationObject?.nextPage))
            .disposed(by: self.disposeBag)
    }
    
    private func getRepositoriesFromLastMonth(_ shouldReload: Bool) {
        self.handleResponse(shouldReload, self.getRepositoriesFromLastMonthUseCase.execute(paginationObject?.nextPage))
            .disposed(by: self.disposeBag)
    }
    
    private func handleResponse(_ shouldReload: Bool, _ response: PrimitiveSequence<SingleTrait, ([GitHubRepository], PaginationObject?)>) -> Disposable {
        return response.subscribe(onSuccess: { [weak self] (result, paginationObject) in
            self?.paginationObject = paginationObject
            shouldReload
                ? self?.repositoriesDataSource.accept(self?.checkFavourites(result) ?? [])
                : self?.appendToDataSource(self?.checkFavourites(result) ?? [])
        }, onError: { error in
            self.errorHandler.onNext(error)
        })
    }
    
    private func appendToDataSource(_ data: [GitHubRepository]) {
        var dataSource = self.repositoriesDataSource.value
        dataSource.append(contentsOf: data)
        self.repositoriesDataSource.accept(dataSource)
    }
    
    func checkFavourites(_ result: [GitHubRepository]) -> [GitHubRepository] {
        var repositories = [GitHubRepository]()
        for var repository in result {
            repository.isFavourite = self.checkIfIsFavouriteUseCase.execute(repository)
            repositories.append(repository)
        }
        return repositories
    }
}
