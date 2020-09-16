//
//  GetRepositoriesRequest.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Alamofire

enum FilterPeriod {
    case createdLastMonth
    case createdLastWeek
    case createdLastDay
}

class GetRepositoriesRequest {
    private let filterPeriod: FilterPeriod
    
    var parameters: [String: Any]? {
        return [
            "q": "created:>\(getFilterQuery())" ,
            "sort": "stars",
            "order": "desc"
        ]
    }
    
    private func getFilterQuery() -> String {
        switch filterPeriod {
        case .createdLastDay:
            return DateHelper().getYesterdaysDate()
        case .createdLastWeek:
            return DateHelper().getLastWeeksDate()
        case .createdLastMonth:
            return DateHelper().getLastMonthsDate()
        }
    }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var path: URL {
        return NetworkConfiguration.apiURL
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.httpBody
    }
    
    let httpMethod: HTTPMethod = .get
    
    init(_ filterPeriod: FilterPeriod) {
        self.filterPeriod = filterPeriod
    }
}
