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
    
    func alreadyExists(_ id: Any) -> Bool {
        return self.realm.object(ofType: T.self, forPrimaryKey: id) != nil
    }
}
