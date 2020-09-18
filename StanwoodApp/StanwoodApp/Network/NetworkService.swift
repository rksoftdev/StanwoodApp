//
//  NetworkService.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 16/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Alamofire
import RxSwift


protocol NetworkServiceable {
    func executeRequest<T: Codable, Z: PaginationObjectable>(url: URL, method: HTTPMethod, parameters: [String: Any]?, headers: [String: String]?) -> Single<(T?,Z?)>
}

class NetworkService: NetworkServiceable {
    private let sessionManager: Session
    private let encoding = URLEncoding(destination: .methodDependent, arrayEncoding: .brackets, boolEncoding: .literal)
    
    init() {
        self.sessionManager = Alamofire.Session.default
    }
    
    func executeRequest<T: Codable, Z: PaginationObjectable>(url: URL, method: HTTPMethod, parameters: [String: Any]?, headers: [String: String]?) -> Single<(T?,Z?)> {
        return Single<(T?,Z?)>.create { [weak self] observer in
            guard let self = self else {
                   return Disposables.create()
            }
                
            let request = self.sessionManager.request(url, method: method, parameters: parameters, encoding: self.encoding, headers: HTTPHeaders(headers ?? [:]))
                .validate()
                .response(completionHandler: { response in
                    switch response.result {
                    case .success(let value):
                        observer(.success((self.handleResponse(data: value), self.handleHeaders(headers: response.response?.headers))))
                    case .failure(let error):
                        observer(.error(error))
                   }
               })
               return Disposables.create {
                   request.cancel()
               }
        }
    }
    
    private func handleResponse<T: Codable>(data: Data?) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data!)
        } catch let error {
            print("Error while parsing data: \(error.localizedDescription)")
            return nil
        }
    }
    
    private func handleHeaders<Z: PaginationObjectable>(headers: HTTPHeaders?) -> Z? {
        return headers?.getPaginationObject() as? Z
    }
}
