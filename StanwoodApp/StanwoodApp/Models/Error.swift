//
//  Error.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

enum ErrorType: String {
    case unrecoginized = "Unrecognized error"
    case cannotSaveToDatabase = "Cannot save to database"
    case cannotFetchData = "Cannot fetch data"
}

class Error: Swift.Error {
    var message: String
    var title: String? = "Error"
    var type: ErrorType?
    
    init(error: Swift.Error?) {
        guard let error = error else {
            self.message = ErrorType.unrecoginized.rawValue
            return
        }
        
        self.message = error.localizedDescription
    }
    
    init(message: String) {
        self.message = message
    }
    
    init(type: ErrorType) {
        self.message = type.rawValue
    }
}
