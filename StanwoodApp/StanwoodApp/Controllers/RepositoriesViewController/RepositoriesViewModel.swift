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
    var errorHandler: BehaviorRelay<Error?> { get }
    var isLoading: BehaviorRelay<Bool> { get }
}

class RepositoriesViewModel: RepositoriesViewModelable {
    var repositoriesDataSource: BehaviorRelay<[GitHubRepository]> = .init(value: [])
    var errorHandler: BehaviorRelay<Error?> = .init(value: nil)
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
        self.getRepositoriesFromLastDayUseCase.execute()
            .subscribe(onSuccess: { [weak self] result in
                self?.repositoriesDataSource.accept(result)
            }, onError: { error in
                print("ERROR: \(error.localizedDescription)")
            }).disposed(by: self.disposeBag)
    }
    
    private func getRepositoriesFromLastWeek() {
        self.getRepositoriesFromLastWeekUseCase.execute()
            .subscribe(onSuccess: { results in
                
            }, onError: { error in
                
            }).disposed(by: self.disposeBag)
    }
    
    private func getRepositoriesFromLastMonth() {
        self.getRepositoriesFromLastMonthUseCase.execute()
            .subscribe(onSuccess: { results in
                
            }, onError: { error in
                
            }).disposed(by: self.disposeBag)
    }
}
