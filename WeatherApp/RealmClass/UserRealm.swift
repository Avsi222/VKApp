//
//  UserRealm.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 20/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import Foundation
import RealmSwift

class UserRealm: Object {
    
    @objc dynamic var idUser: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photoUrl: String = ""
    @objc dynamic var age: String = ""
    @objc dynamic var aboutMe: String = ""
    
    convenience init(id: Int, firstName: String, lastName: String,photoUrl:String,age:String,about:String) {
        self.init()
        
        self.idUser = id
        self.firstName = firstName
        self.lastName = lastName
        self.photoUrl = photoUrl
        self.age = age
        self.aboutMe = about
    }
}
