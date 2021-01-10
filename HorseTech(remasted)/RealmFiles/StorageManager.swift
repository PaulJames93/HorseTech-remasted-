//
//  StorageManager.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 10.01.2021.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class StorageManagerName {
    static func saveObject(_ item: Person){
        try! realm.write{
            realm.add(item)
        }
    }
}

class StorageManagerImages{
    static func saveObject(_ item: Images) {
        try! realm.write{
            realm.add(item)
        }
    }
}
