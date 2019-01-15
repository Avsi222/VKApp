//
//  FriendsRealm.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 20/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import Foundation
import RealmSwift

class FriendsRealm: Object {
    
    enum Properties: String {
        case idUser
        case firstName
        case lastName
        case photoUrl
    }
    
    @objc dynamic var idUser: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photoUrl: String = ""
    
    convenience init(id: Int, firstName: String, lastName: String,photoUrl:String) {
        self.init()
        
        self.idUser = id
        self.firstName = firstName
        self.lastName = lastName
        self.photoUrl = photoUrl
    }
    
    override static func primaryKey() -> String? {
        return Properties.idUser.rawValue
    }
    
    override static func indexedProperties() -> [String] {
        return [Properties.firstName.rawValue]
    }
    
    override static func ignoredProperties() -> [String] {
        return [""]
    }
}
