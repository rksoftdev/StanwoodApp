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
    var errorHandler: PublishSubject<Error> { get }
}

class RepositoriesViewModel: RepositoriesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> = .init(value: [])
    var errorHandler: PublishSubject<Error> = .init()
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    
    private let disposeBag: DisposeBag
    
    private let getRepositoriesFromLastDayUseCase: GetRepositoriesFromLastDayUseCaseable
    private let getRepositoriesFromLastWeekUseCase: GetRepositoriesFromLastWeekUseCaseable
    private let getRepositoriesFromLastMonthUseCase: GetRepositoriesFromLastMonthUseCaseable
    
    init(_ getRepositoriesFromLastDayUseCase: GetRepositoriesFromLastDayUseCaseable, _ getRepositoriesFromLastWeekUseCase: GetRepositoriesFromLastWeekUseCaseable, _ getRepositoriesFromLastMonthUseCase: GetRepositoriesFromLastMonthUseCaseable) {
        self.getRepositoriesFromLastDayUseCase = getRepositoriesFromLastDayUseCase
        self.getRepositoriesFromLastWeekUseCase = getRepositoriesFromLastWeekUseCase
        self.getRepositoriesFromLastMonthUseCase = getRepositoriesFromLastMonthUseCase
        self.disposeBag = DisposeBag()
    }
    
    func reloadData(with filterPeriod: FilterPeriod) {
        switch filterPeriod {
        case .createdLastDay:
            getRepositoriesFromLastDay()
        case .createdLastWeek:
            getRepositoriesFromLastWeek()
        case .createdLastMonth:
            getRepositoriesFromLastMonth()
        }
    }
    
    private func getRepositoriesFromLastDay() {
        self.handleResponse(self.getRepositoriesFromLastDayUseCase.execute())
            .disposed(by: self.disposeBag)
    }
    
    private func getRepositoriesFromLastWeek() {
        self.handleResponse(self.getRepositoriesFromLastWeekUseCase.execute())
            .disposed(by: self.disposeBag)
    }
    
    private func getRepositoriesFromLastMonth() {
        self.handleResponse(self.getRepositoriesFromLastMonthUseCase.execute())
            .disposed(by: self.disposeBag)
    }
    
    func handleResponse(_ response: PrimitiveSequence<SingleTrait, [GitHubRepository]>) -> Disposable {
        return response.subscribe(onSuccess: { [weak self] result in
            self?.repositoriesDataSource.accept(result)
        }, onError: { error in
            print(error.localizedDescription)
            self.errorHandler.onNext(Error(type: .cannotFetchData))
        })
    }
}
