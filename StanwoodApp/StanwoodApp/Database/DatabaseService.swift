//
//  DatabaseService.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import Realm
import RealmSwift

typealias RealmHandler = (Realm) -> Void
protocol DatabaseServiceable {
    func save(_ object: Object, update: Realm.UpdatePolicy, completion: (Error?) -> Void)
    func object<Element: Object, KeyType>(ofType type: Element.Type, forPrimaryKey key: KeyType) -> Element?
    func results<Element: Object>(_ type: Element.Type, predicate: NSPredicate) -> Results<Element>
}

class DatabaseService: DatabaseServiceable {
    //MARK: Properties
    private let realm: Realm

    // MARK: Initializers
    init(_ realm: Realm) {
        self.realm = realm
    }

    // MARK: Methods
    func save(_ object: Object, update: Realm.UpdatePolicy, completion: (Error?) -> Void) {
        do {
            try realm.write {
                realm.add(object, update: update)
            }
        } catch {
            completion(Error(error: error))
        }
        completion(nil)
    }

    func object<Element: Object, KeyType>(ofType type: Element.Type, forPrimaryKey key: KeyType) -> Element? {
        return realm.object(ofType: type, forPrimaryKey: key)
    }
    
    func results<Element: Object>(_ type: Element.Type, predicate: NSPredicate) -> Results<Element> {
        return realm.objects(type).filter(predicate)
    }
}
