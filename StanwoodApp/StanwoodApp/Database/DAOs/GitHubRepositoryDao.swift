//
//  GitHubRepositoryDao.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 17/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import RealmSwift

protocol GitHubRepositoryDaoable {
    func checkIfIsFavourite(_ id: Int) -> Bool
    func save(_ object: GitHubRepositoryEntity)
    func delete(_ object: GitHubRepositoryEntity)
    func getAll() -> Results<GitHubRepositoryEntity>
}

class GitHubRepositoryDao: BaseDao<GitHubRepositoryEntity>, GitHubRepositoryDaoable {
    func delete(_ object: GitHubRepositoryEntity) {
        let predicate = NSPredicate(format: "id == %d", object.id)
        let objects = getFilteredOrAll(predicate)
        delete(objects)
    }
    
    func checkIfIsFavourite(_ id: Int) -> Bool {
        let predicate = NSPredicate(format: "id == %d", id)
        let objects = getFilteredOrAll(predicate)
        return !objects.toArray().isEmpty
    }
}

extension Results where Element == GitHubRepositoryEntity {
    func toArray() -> [GitHubRepositoryEntity] {
        return Array(self)
    }
}
