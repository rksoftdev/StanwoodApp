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
    func checkIfIsFavourite(_ id: Int) -> Bool {
        return alreadyExists(id)
    }
    
    func delete(_ object: GitHubRepositoryEntity) {
        let objects = getAll().filter("id == %d", object.id)
        delete(objects)
    }
}
