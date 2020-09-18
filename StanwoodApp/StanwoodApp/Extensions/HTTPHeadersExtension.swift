//
//  HTTPHeadersExtension.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 18/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Alamofire

extension HTTPHeaders {
    func getPaginationObject() -> PaginationObject? {
        guard let link = self.value(for: "Link") else {
            return nil
        }
        
        return link.splitLink()
    }
}

fileprivate extension String {
    func splitLink() -> PaginationObject {
        var paginationObject = PaginationObject()
        let links = self.components(separatedBy: ",")
        var dictionary: [String: String] = [:]
        
        links.forEach({
            let components = $0.components(separatedBy:"; ")
            let cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
            dictionary[components[1]] = cleanPath
        })
        if let nextPagePath = dictionary["rel=\"next\""] {
            paginationObject.appendPage(for: .next, nextPagePath.getPageValue())
        }
        if let previousPagePath = dictionary["rel=\"previous\""] {
            paginationObject.appendPage(for: .previous, previousPagePath.getPageValue())
        }
        if let lastPagePath = dictionary["rel=\"last\""] {
            paginationObject.appendPage(for: .last, lastPagePath.getPageValue())
        }
        if let firstPagePath = dictionary["rel=\"first\""] {
            paginationObject.appendPage(for: .first, firstPagePath.getPageValue())
        }
        
        return paginationObject
    }
    
    func getPageValue() -> Int? {
        var returnValue: Int?
        let parts = self.components(separatedBy: "&")
        parts.forEach { part in
            let components = part.components(separatedBy: "=")
            if components[0] == "page" {
                returnValue = Int(components[1])
            }
        }
        return returnValue
    }
}
