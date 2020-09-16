//
//  DateHelper.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case yyyyMMdd = "yyyy-MM-dd"
    case yyyyMMddTHHmmssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
}

class DateHelper {
    private let dateFormatter = DateFormatter()
    
    func getYesterdaysDate(_ dateFormat: DateFormat) -> String {
        dateFormatter.dateFormat = dateFormat.rawValue
        return getDateStringFromNow(bySubstract: .day, value: 1)
    }
    
    func getLastWeeksDate(_ dateFormat: DateFormat) -> String {
        dateFormatter.dateFormat = dateFormat.rawValue
        return getDateStringFromNow(bySubstract: .day, value: 7)
    }
    
    func getLastMonthsDate(_ dateFormat: DateFormat) -> String {
        dateFormatter.dateFormat = dateFormat.rawValue
        return getDateStringFromNow(bySubstract: .month, value: 1)
    }
    
    func getDateStringFrom(_ dateString: String, _ dateFormat: DateFormat) -> String {
        dateFormatter.dateFormat = dateFormat.rawValue
        guard let date = dateFormatter.date(from: dateString) else {
            return ""
        }
        dateFormatter.dateFormat = DateFormat.yyyyMMdd.rawValue
        return dateFormatter.string(from: date)
    }
    
    private func getDateStringFromNow(bySubstract: Calendar.Component, value: Int) -> String {
        guard let yesterdaysDate = Calendar.current.date(byAdding: bySubstract, value: -value, to: Date()) else {
            return ""
        }
        
        return dateFormatter.string(from: yesterdaysDate)
    }
}
