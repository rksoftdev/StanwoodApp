//
//  BaseDao.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RealmSwift

class BaseDao <T:Object> {
    private let realm: Realm
    
    init() {
        self.realm = try! Realm()
    }
    
    func save(_ object: T) {
        try! self.realm.write {
            self.realm.add(object)
        }
    }
    
    func getAll() -> Results<T> {
        let elements = self.realm.objects(T.self)
        return elements
    }
    
    func delete(_ objects: Results<T>) {
        try! self.realm.write {
            realm.delete(objects)
        }
    }
    
    func getFilteredOrAll(_ predicate: NSPredicate? = nil) -> Results<T> {
        let objects = self.realm.objects(T.self)
        guard let filter = predicate else {
            return objects
        }
        return objects.filter(filter)
    }
}
