//
//  GetRepositoriesRequest.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Alamofire

enum FilterPeriod: Int {
    case createdLastDay
    case createdLastWeek
    case createdLastMonth
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
            return DateHelper().getYesterdaysDate(.yyyyMMdd)
        case .createdLastWeek:
            return DateHelper().getLastWeeksDate(.yyyyMMdd)
        case .createdLastMonth:
            return DateHelper().getLastMonthsDate(.yyyyMMdd)
        }
    }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var url: URL {
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
