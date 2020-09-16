//
//  DateHelper.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Foundation

class DateHelper {
    private let dateFormatter = DateFormatter()
    
    func getYesterdaysDate() -> String {
        getDateStringFromNow(bySubstract: .day, value: 1)
    }
    
    func getLastWeeksDate() -> String {
        getDateStringFromNow(bySubstract: .day, value: 7)
    }
    
    func getLastMonthsDate() -> String {
        getDateStringFromNow(bySubstract: .month, value: 1)
    }
    
    private func getDateStringFromNow(bySubstract: Calendar.Component, value: Int) -> String {
        guard let yesterdaysDate = Calendar.current.date(byAdding: bySubstract, value: -value, to: Date()) else {
            return ""
        }
        
        return dateFormatter.string(from: yesterdaysDate)
    }
    
    init() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
}
