//
//  UserModel.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 10.01.2021.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var name: String = ""
}

class Images: Object {
    @objc dynamic var image: String = ""
}
