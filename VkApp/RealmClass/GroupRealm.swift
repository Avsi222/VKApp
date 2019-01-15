//
//  GroupRealm.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 20/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import Foundation
import RealmSwift

class GroupsRealm: Object {
    
    
    enum Properties: String {
        case idGroup
        case Name
        case photoUrl
    }
    
    @objc dynamic var idGroup: Int = 0
    @objc dynamic var Name: String = ""
    @objc dynamic var photoUrl: String = ""
    
    convenience init(id: Int, name: String,photoUrl:String) {
        self.init()
        
        self.idGroup = id
        self.Name = name
        self.photoUrl = photoUrl
    }
    
    override static func primaryKey() -> String? {
        return Properties.idGroup.rawValue
    }
    
    override static func indexedProperties() -> [String] {
        return [Properties.Name.rawValue]
    }
    
    override static func ignoredProperties() -> [String] {
        return [""]
    }
}
