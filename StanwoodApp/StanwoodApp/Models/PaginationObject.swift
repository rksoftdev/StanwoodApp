//
//  PaginationObject.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 18/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//


enum PaginationPage {
    case next
    case last
    case previous
    case first
}

protocol PaginationObjectable {
    var nextPage: Int? { get }
    var lastPage: Int? { get }
    var previousPage: Int? { get }
    var firstPage: Int? { get }
}

struct PaginationObject: PaginationObjectable {
    var nextPage: Int?
    var lastPage: Int?
    var previousPage: Int?
    var firstPage: Int?
    
    var canLoadNextPage: Bool {
        return nextPage ?? 0 != 0 || nextPage ?? 0 != lastPage ?? 0
    }
    
    mutating func appendPage(for type: PaginationPage, _ value: Int?) {
        switch type {
        case .first:
            self.firstPage = value
        case .last:
            self.lastPage = value
        case .next:
            self.nextPage = value
        case .previous:
            self.previousPage = value
        }
    }
}
