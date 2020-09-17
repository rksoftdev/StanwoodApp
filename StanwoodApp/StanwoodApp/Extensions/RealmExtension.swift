//
//  RealmExtension.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RealmSwift
import Realm

extension Realm {
    static private let realmConfiguration = Realm.Configuration.defaultConfiguration

    static func defaultRealm() -> Realm {
        let documentsPath: NSString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let realmPath = documentsPath.appendingPathComponent("stanwood.db")
        var realm: Realm?
        do {
            var configuration = self.realmConfiguration
            configuration.fileURL = NSURL(fileURLWithPath: realmPath) as URL
            realm = try Realm(configuration: configuration)
        } catch _ as NSError {
            do {
                try FileManager.default.removeItem(atPath: realmPath)
            } catch {
                print(#function)
            }
            realm = defaultRealm()
        }
        return realm!
    }
}
